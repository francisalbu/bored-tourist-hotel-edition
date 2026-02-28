import type { VercelRequest, VercelResponse } from '@vercel/node';

/**
 * Viator Affiliate Redirect Endpoint
 * 
 * Redirects to the Viator product page with affiliate tracking params.
 * This allows us to show a clean URL in the app while still getting
 * affiliate commission tracking via Viator's pid/mcid system.
 * 
 * Usage: /api/viator-redirect?product=156455P1
 */

const VIATOR_PID = 'P00285354';
const VIATOR_MCID = '42383';

// Map of product codes to their full Viator URLs
const PRODUCT_URLS: Record<string, string> = {
  '156455P1': 'https://www.viator.com/tours/Lisbon/Eats-Street-Art-and-Undiscovered-Lisbon-Food-Tour/d538-156455P1',
  '5560182P5': 'https://www.viator.com/tours/Lisbon/Lisbon-Baixa-district-food-tour-with-a-local/d538-5560182P5',
};

export default function handler(req: VercelRequest, res: VercelResponse) {
  const productCode = req.query.product as string;

  if (!productCode || !PRODUCT_URLS[productCode]) {
    return res.status(400).json({ error: 'Invalid product code' });
  }

  const baseUrl = PRODUCT_URLS[productCode];
  const affiliateUrl = `${baseUrl}?pid=${VIATOR_PID}&mcid=${VIATOR_MCID}&medium=link`;

  // 302 redirect to Viator with affiliate tracking
  res.redirect(302, affiliateUrl);
}
