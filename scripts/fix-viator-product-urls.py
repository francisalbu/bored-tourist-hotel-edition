#!/usr/bin/env python3
"""
Re-fetch canonical productUrl from Viator API for ALL Viator products
and generate UPDATE SQL so every affiliate_url goes directly to the
specific activity page (not the city listing with "You selected").

Usage:
  python3 scripts/fix-viator-product-urls.py 2>/dev/null > scripts/fix-viator-product-urls.sql
"""

import json, sys, time
from urllib.request import urlopen, Request
from urllib.error import HTTPError, URLError
import re

API_KEY = "0a9b6163-6d27-4f03-bab6-e5debd3d7a8c"
AFFILIATE = "pid=P00285354&mcid=42383&medium=link"

# All Viator products: (display_order, dest_code, product_code)
# Verified against actual SQL files (add-viator-porto-batch-*.sql, add-viana-batch-1.sql, add-funchal-batch-*.sql)
PRODUCTS = [
    # Porto Batch 1 (105-109) - d26879
    (105, "26879", "7592P12"),
    (106, "26879", "384973P1"),
    (107, "26879", "442666P1"),
    (108, "26879", "122201P7"),
    (109, "26879", "406702P4"),
    # Porto Batch 2 (110-115)
    (110, "26879", "7372P39"),
    (111, "26879", "204176P3"),
    (112, "26879", "264534P1"),
    (113, "26879", "154994P1"),
    (114, "26879", "174294P3"),
    (115, "26879", "14873P1"),
    # Porto Batch 3 (116-121)
    (116, "26879", "31913P1"),
    (117, "26879", "12546DOUROVALLEY"),  # unusual legacy code
    (118, "26879", "48293P7"),
    (119, "26879", "6877P104"),
    (120, "26879", "8996P137"),
    (121, "26879", "5902P10"),
    # Porto Batch 4 (122-127)
    (122, "26879", "118678P21"),
    (123, "26879", "58705P7"),
    (124, "26879", "75688P1"),
    (125, "26879", "26918P6"),
    (126, "26879", "7372P18"),
    (127, "26879", "43382P8"),
    # Porto Batch 5 (128-133)
    (128, "26879", "194996P4"),
    (129, "26879", "66616P4"),
    (130, "26879", "19333P1"),
    (131, "26879", "7812P85"),
    (132, "26879", "405446P1"),
    (133, "26879", "168365P4"),
    # Porto Batch 6 (134-141)
    (134, "26879", "57617P1"),
    (135, "26879", "18121P3"),
    (136, "26879", "66671P1"),
    (137, "26879", "102838P1"),
    (138, "26879", "203526P17"),
    (139, "26879", "131810P2"),
    (140, "26879", "7378P2"),
    (141, "26879", "124583P2"),
    # Viana do Castelo Batch 1 - Viator only (142-143)
    (142, "27331", "176562P1"),
    (143, "26879", "63975P3"),
    # Funchal Batch 1 (181-188)
    (181, "5392",  "43786P1"),
    (182, "22388", "112367P38"),
    (183, "5392",  "192925P1"),
    (184, "22388", "125569P1"),
    (185, "22388", "16720P4"),
    (186, "50841", "23523P1"),
    (187, "5392",  "23651P5"),
    (188, "22388", "10440P2"),
    # Funchal Batch 2 (189-196)
    (189, "5392",  "50221P2"),
    (190, "5392",  "15879P2"),
    (191, "22388", "36979P10"),
    (192, "5392",  "336742P1"),
    (193, "22388", "463149P6"),
    (194, "22388", "209899P2"),
    (195, "22388", "16720P16"),
    (196, "5392",  "28388P1"),
    # Funchal Batch 3 (197-202) - Viator only
    (197, "5392",  "409330P1"),
    (198, "5392",  "9951P1"),
    (199, "22388", "5538552P6"),
    (200, "5392",  "23651P17"),
    (201, "22388", "39129P5"),
    (202, "5392",  "7543P1"),
]


def fetch_product_url(code: str) -> str | None:
    url = f"https://api.viator.com/partner/products/{code}"
    req = Request(url, headers={
        "exp-api-key": API_KEY,
        "Accept": "application/json;version=2.0",
        "Accept-Language": "en-GB",
    })
    try:
        with urlopen(req, timeout=15) as r:
            data = json.loads(r.read())
        product_url = data.get("productUrl", "")
        if not product_url:
            return None
        # productUrl from API: https://www.viator.com/en-GB/tours/.../d...-CODE?mcid=...&pid=...&medium=api&api_version=2.0
        # Strip Viator's own params, keep only our affiliate params
        base = product_url.split("?")[0]
        return f"{base}?{AFFILIATE}"
    except HTTPError as e:
        print(f"  HTTP {e.code} for {code}", file=sys.stderr)
        return None
    except URLError as e:
        print(f"  URL error for {code}: {e}", file=sys.stderr)
        return None


def main():
    print("-- =====================================================", file=sys.stdout)
    print("-- FIX: Viator affiliate_url → canonical productUrl", file=sys.stdout)
    print("-- Fixes 'Explore City / You selected' redirect bug", file=sys.stdout)
    print("-- Run in: Supabase Dashboard → SQL Editor", file=sys.stdout)
    print("-- =====================================================\n", file=sys.stdout)

    ok = 0
    skip = 0

    for display_order, dest_code, code in PRODUCTS:
        print(f"[{display_order}] Fetching {code}...", file=sys.stderr)
        url = fetch_product_url(code)
        if not url:
            print(f"  SKIP {code} — no productUrl", file=sys.stderr)
            skip += 1
            time.sleep(0.5)
            continue

        # Escape single quotes for SQL
        safe_url = url.replace("'", "''")
        print(f"  ✓ {url[:80]}", file=sys.stderr)

        print(f"-- display_order {display_order}: {code}", file=sys.stdout)
        print(f"UPDATE experiences SET affiliate_url = '{safe_url}'", file=sys.stdout)
        print(f"WHERE display_order = {display_order} AND affiliate_provider = 'Viator';\n", file=sys.stdout)

        ok += 1
        time.sleep(0.3)

    print(f"\n-- Done: {ok} updated, {skip} skipped.", file=sys.stdout)
    print(f"\n-- Done: {ok} updated, {skip} skipped.", file=sys.stderr)


if __name__ == "__main__":
    main()
