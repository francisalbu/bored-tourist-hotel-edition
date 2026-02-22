/**
 * ──────────────────────────────────────────────────────────────
 *  Bored Tourist — Embeddable Experiences Widget  (v2.0)
 * ──────────────────────────────────────────────────────────────
 *
 *  Usage — add this to any hotel website:
 *
 *  <div
 *    data-bt-widget
 *    data-hotel-id="vila-gale"
 *    data-limit="6"
 *    data-columns="3"
 *    data-category=""
 *    data-lang="en"
 *  ></div>
 *  <script src="https://YOUR_DOMAIN/widget/bt-widget.js" async></script>
 *
 * ──────────────────────────────────────────────────────────────
 */
(function () {
  'use strict';

  /* ── Resolve base URL from the <script> src ──────────────── */
  var SCRIPT  = document.currentScript;
  var ORIGIN  = SCRIPT ? new URL(SCRIPT.src).origin : window.location.origin;
  var API_URL = ORIGIN + '/api';
  var BOOK_URL = ORIGIN + '/widget/book.html';

  /* ── Translations ────────────────────────────────────────── */
  var I18N = {
    en: { loading: 'Loading experiences…', empty: 'No experiences available at the moment.', error: 'Unable to load experiences.', book: 'Book', from: 'From', poweredBy: 'Powered by', close: 'Close' },
    pt: { loading: 'A carregar experiências…', empty: 'Sem experiências disponíveis de momento.', error: 'Não foi possível carregar experiências.', book: 'Reservar', from: 'Desde', poweredBy: 'Powered by', close: 'Fechar' },
    es: { loading: 'Cargando experiencias…', empty: 'No hay experiencias disponibles en este momento.', error: 'No se pudieron cargar las experiencias.', book: 'Reservar', from: 'Desde', poweredBy: 'Powered by', close: 'Cerrar' },
    fr: { loading: 'Chargement des expériences…', empty: 'Aucune expérience disponible pour le moment.', error: 'Impossible de charger les expériences.', book: 'Réserver', from: 'À partir de', poweredBy: 'Powered by', close: 'Fermer' },
  };

  function t(lang, key) {
    return (I18N[lang] || I18N.en)[key] || I18N.en[key];
  }

  /* ── Init ─────────────────────────────────────────────────── */
  function init() {
    var containers = document.querySelectorAll('[data-bt-widget]');
    if (!containers.length) return;
    injectStyles();
    containers.forEach(function (c) { bootstrap(c); });
  }

  /* ── Bootstrap one container ──────────────────────────────── */
  function bootstrap(container) {
    var hotelId  = container.getAttribute('data-hotel-id');
    var limit    = parseInt(container.getAttribute('data-limit') || '6', 10);
    var cols     = container.getAttribute('data-columns') || '3';
    var category = container.getAttribute('data-category') || '';
    var lang     = container.getAttribute('data-lang') || 'en';

    if (!hotelId) {
      console.error('[Bored Tourist Widget] data-hotel-id is required');
      return;
    }

    container.classList.add('bt-widget');
    container.style.setProperty('--bt-cols', cols);

    container.innerHTML =
      '<div class="bt-loading"><div class="bt-spinner"></div><span>' + t(lang, 'loading') + '</span></div>';

    var url = API_URL + '/widget-experiences?hotel=' + enc(hotelId) + '&limit=' + limit;
    if (category) url += '&category=' + enc(category);

    fetch(url)
      .then(function (r) { return r.json(); })
      .then(function (data) { render(container, data, hotelId, lang); })
      .catch(function () {
        container.innerHTML = '<div class="bt-error">' + t(lang, 'error') + '</div>';
      });
  }

  /* ── Render grid ──────────────────────────────────────────── */
  function render(container, data, hotelId, lang) {
    var experiences = data.experiences || [];
    var hotel       = data.hotel || {};
    var primary     = (hotel.theme && hotel.theme.primaryColor) || '#1e293b';

    container.style.setProperty('--bt-primary', primary);

    if (!experiences.length) {
      container.innerHTML = '<div class="bt-empty">' + t(lang, 'empty') + '</div>';
      return;
    }

    var grid = mk('div', 'bt-grid');
    experiences.forEach(function (exp) {
      grid.appendChild(createCard(exp, hotelId, primary, lang));
    });

    container.innerHTML = '';
    container.appendChild(grid);

    // Powered-by
    var footer = mk('div', 'bt-footer');
    footer.innerHTML =
      t(lang, 'poweredBy') +
      ' <a href="https://boredtourist.com" target="_blank" rel="noopener noreferrer">' +
        '<svg class="bt-logo-icon" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="10" cy="10" r="9" stroke="currentColor" stroke-width="1.5"/><path d="M6 13c1-2 3-3 4-3s3 1 4 3" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/><circle cx="7.5" cy="8" r="1" fill="currentColor"/><circle cx="12.5" cy="8" r="1" fill="currentColor"/></svg>' +
        'Bored Tourist' +
      '</a>';
    container.appendChild(footer);
  }

  /* ── Card builder (vertical video style) ──────────────────── */
  function createCard(exp, hotelId, primary, lang) {
    var card = mk('div', 'bt-card');

    var imageUrl = (exp.images && exp.images.length) ? exp.images[0] : exp.image_url;
    var videoUrl = exp.video_url || '';
    var title    = exp.title || '';
    var currency = exp.currency || '€';
    var price    = exp.price || 0;
    var rating   = exp.rating || 0;
    var duration = exp.duration || '';
    var category = (exp.category || '').split(',')[0].trim();

    /* ── Media container (9:16 aspect) ── */
    var media = mk('div', 'bt-card-media');

    // Poster image (always visible initially)
    var poster = document.createElement('img');
    poster.src = imageUrl || '';
    poster.alt = title;
    poster.className = 'bt-poster';
    poster.loading = 'lazy';
    poster.onerror = function () { this.src = 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=800'; };
    media.appendChild(poster);

    // Video element (hidden until hover)
    var video = null;
    if (videoUrl) {
      video = document.createElement('video');
      video.src = videoUrl;
      video.className = 'bt-video';
      video.muted = true;
      video.loop = true;
      video.playsInline = true;
      video.setAttribute('playsinline', '');
      video.setAttribute('webkit-playsinline', '');
      video.preload = 'none';
      media.appendChild(video);
    }

    // Gradient overlay
    var grad = mk('div', 'bt-gradient');
    media.appendChild(grad);

    // Category badge
    if (category) {
      var badge = mk('div', 'bt-badge');
      badge.textContent = category.toUpperCase();
      media.appendChild(badge);
    }

    // Play button (center)
    if (videoUrl) {
      var playCircle = mk('div', 'bt-play-circle');
      playCircle.innerHTML = '<svg width="22" height="22" viewBox="0 0 24 24" fill="white"><polygon points="6 3 20 12 6 21 6 3"/></svg>';
      media.appendChild(playCircle);

      // Click play → open lightbox
      playCircle.addEventListener('click', function (e) {
        e.stopPropagation();
        openLightbox(exp, imageUrl, videoUrl, hotelId, primary, lang);
      });
    }

    // Info overlay at bottom
    var info = mk('div', 'bt-card-info');

    var h3 = mk('h3', 'bt-card-title');
    h3.textContent = title;
    info.appendChild(h3);

    var metaRow = mk('div', 'bt-card-meta');
    if (duration) {
      metaRow.innerHTML += '<span class="bt-meta-item"><svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg> ' + esc(duration) + '</span>';
    }
    if (rating) {
      metaRow.innerHTML += '<span class="bt-meta-sep">&bull;</span><span class="bt-meta-item"><svg width="12" height="12" viewBox="0 0 24 24" fill="#facc15"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg> ' + rating.toFixed(1) + '</span>';
    }
    info.appendChild(metaRow);

    var bottom = mk('div', 'bt-card-bottom');
    var priceEl = mk('div', 'bt-card-price');
    priceEl.textContent = currency + price;
    bottom.appendChild(priceEl);

    var bookBtn = document.createElement('button');
    bookBtn.className = 'bt-book-btn';
    bookBtn.textContent = t(lang, 'book');
    bookBtn.addEventListener('click', function (e) {
      e.stopPropagation();
      var url = BOOK_URL + '?hotel=' + enc(hotelId) + '&exp=' + enc(exp.id);
      window.location.href = url;
    });
    bottom.appendChild(bookBtn);
    info.appendChild(bottom);

    media.appendChild(info);
    card.appendChild(media);

    // Hover → play video preview (muted)
    if (video) {
      card.addEventListener('mouseenter', function () {
        video.play().catch(function () {});
        video.style.opacity = '1';
        poster.style.opacity = '0';
        if (card.querySelector('.bt-play-circle')) card.querySelector('.bt-play-circle').classList.add('bt-playing');
      });
      card.addEventListener('mouseleave', function () {
        video.pause();
        video.currentTime = 0;
        video.style.opacity = '0';
        poster.style.opacity = '1';
        if (card.querySelector('.bt-play-circle')) card.querySelector('.bt-play-circle').classList.remove('bt-playing');
      });
    }

    return card;
  }

  /* ── Video Lightbox ───────────────────────────────────────── */
  function openLightbox(exp, imageUrl, videoUrl, hotelId, primary, lang) {
    var overlay = mk('div', 'bt-lightbox');

    var container = mk('div', 'bt-lightbox-container');

    // Close button
    var closeBtn = mk('button', 'bt-lightbox-close');
    closeBtn.innerHTML = '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2.5" stroke-linecap="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>';
    closeBtn.addEventListener('click', function () { closeLightbox(overlay); });
    container.appendChild(closeBtn);

    // Video wrapper
    var vidWrap = mk('div', 'bt-lightbox-video');
    var vid = document.createElement('video');
    vid.src = videoUrl;
    vid.autoplay = true;
    vid.controls = true;
    vid.loop = true;
    vid.playsInline = true;
    vid.setAttribute('playsinline', '');
    vid.poster = imageUrl || '';
    vidWrap.appendChild(vid);
    container.appendChild(vidWrap);

    // Info panel
    var infoPanel = mk('div', 'bt-lightbox-info');

    var category = (exp.category || '').split(',')[0].trim();
    if (category) {
      var catEl = mk('div', 'bt-lightbox-cat');
      catEl.textContent = category.toUpperCase();
      infoPanel.appendChild(catEl);
    }

    var titleEl = mk('h2', 'bt-lightbox-title');
    titleEl.textContent = exp.title || '';
    infoPanel.appendChild(titleEl);

    var descEl = mk('p', 'bt-lightbox-desc');
    descEl.textContent = exp.description || exp.short_description || '';
    infoPanel.appendChild(descEl);

    var metaEl = mk('div', 'bt-lightbox-meta');
    var dur = exp.duration || '';
    var rat = exp.rating || 0;
    if (dur) metaEl.innerHTML += '<span>&#9201; ' + esc(dur) + '</span>';
    if (rat) metaEl.innerHTML += '<span>&#11088; ' + rat.toFixed(1) + '</span>';
    infoPanel.appendChild(metaEl);

    var priceRow = mk('div', 'bt-lightbox-price-row');
    var priceEl = mk('div', 'bt-lightbox-price');
    priceEl.textContent = (exp.currency || '\u20ac') + (exp.price || 0);
    priceRow.appendChild(priceEl);

    var bookBtn = document.createElement('button');
    bookBtn.className = 'bt-lightbox-book';
    bookBtn.textContent = t(lang, 'book');
    bookBtn.style.backgroundColor = primary;
    bookBtn.addEventListener('click', function () {
      var url = BOOK_URL + '?hotel=' + enc(hotelId) + '&exp=' + enc(exp.id);
      window.location.href = url;
    });
    priceRow.appendChild(bookBtn);
    infoPanel.appendChild(priceRow);

    container.appendChild(infoPanel);
    overlay.appendChild(container);

    // Close on overlay click
    overlay.addEventListener('click', function (e) {
      if (e.target === overlay) closeLightbox(overlay);
    });

    // Close on Escape
    var escHandler = function (e) {
      if (e.key === 'Escape') { closeLightbox(overlay); document.removeEventListener('keydown', escHandler); }
    };
    document.addEventListener('keydown', escHandler);

    document.body.appendChild(overlay);
    requestAnimationFrame(function () { overlay.classList.add('bt-lightbox-open'); });
  }

  function closeLightbox(overlay) {
    overlay.classList.remove('bt-lightbox-open');
    var vid = overlay.querySelector('video');
    if (vid) { vid.pause(); vid.src = ''; }
    setTimeout(function () { if (overlay.parentNode) overlay.parentNode.removeChild(overlay); }, 300);
  }

  /* ── Helpers ──────────────────────────────────────────────── */
  function mk(tag, cls) {
    var node = document.createElement(tag);
    if (cls) node.className = cls;
    return node;
  }

  function enc(s) { return encodeURIComponent(s); }

  function esc(s) {
    var d = document.createElement('div');
    d.textContent = s || '';
    return d.innerHTML;
  }

  /* ── Inject scoped CSS ────────────────────────────────────── */
  function injectStyles() {
    if (document.getElementById('bt-widget-css')) return;
    var style = document.createElement('style');
    style.id = 'bt-widget-css';
    style.textContent = BT_CSS;
    document.head.appendChild(style);
  }

  var BT_CSS = [
    /* Reset / scope */
    '.bt-widget { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; -webkit-font-smoothing: antialiased; box-sizing: border-box; }',
    '.bt-widget *, .bt-widget *::before, .bt-widget *::after { box-sizing: inherit; margin: 0; padding: 0; }',

    /* Grid */
    '.bt-grid { display: grid; grid-template-columns: repeat(var(--bt-cols, 3), 1fr); gap: 20px; }',
    '@media (max-width: 960px) { .bt-grid { grid-template-columns: repeat(2, 1fr); } }',
    '@media (max-width: 600px) { .bt-grid { grid-template-columns: 1fr; max-width: 400px; margin: 0 auto; } }',

    /* Card */
    '.bt-card { cursor: pointer; border-radius: 16px; overflow: hidden; transition: transform .3s ease, box-shadow .3s ease; position: relative; }',
    '.bt-card:hover { transform: translateY(-4px); box-shadow: 8px 8px 0px 0px rgba(0,0,0,0.9); }',

    /* Media container — 9:14 vertical */
    '.bt-card-media { position: relative; aspect-ratio: 9/14; overflow: hidden; border-radius: 16px; background: #0f172a; }',

    /* Poster & Video */
    '.bt-poster { position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; transition: opacity .4s ease, transform .7s ease; }',
    '.bt-card:hover .bt-poster { transform: scale(1.05); }',
    '.bt-video { position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; opacity: 0; transition: opacity .4s ease; }',

    /* Gradient overlay */
    '.bt-gradient { position: absolute; inset: 0; background: linear-gradient(to top, rgba(0,0,0,.85) 0%, rgba(0,0,0,.4) 40%, transparent 70%); pointer-events: none; }',

    /* Category badge */
    '.bt-badge { position: absolute; top: 12px; left: 12px; background: rgba(255,255,255,.92); backdrop-filter: blur(8px); color: #000; font-size: 9px; font-weight: 800; letter-spacing: .1em; padding: 4px 10px; border-radius: 4px; z-index: 2; }',

    /* Play circle */
    '.bt-play-circle { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 52px; height: 52px; border-radius: 50%; background: rgba(255,255,255,.18); backdrop-filter: blur(12px); display: flex; align-items: center; justify-content: center; z-index: 3; cursor: pointer; transition: all .3s ease; border: 1.5px solid rgba(255,255,255,.3); }',
    '.bt-play-circle svg { margin-left: 3px; }',
    '.bt-play-circle:hover { background: rgba(255,255,255,.3); transform: translate(-50%, -50%) scale(1.1); }',
    '.bt-play-circle.bt-playing { opacity: 0; transform: translate(-50%, -50%) scale(1.5); }',

    /* Info overlay (bottom) */
    '.bt-card-info { position: absolute; bottom: 0; left: 0; right: 0; padding: 16px; z-index: 2; }',
    '.bt-card-title { color: #fff; font-size: 17px; font-weight: 800; text-transform: uppercase; letter-spacing: -.01em; line-height: 1.2; margin-bottom: 8px; text-shadow: 0 1px 4px rgba(0,0,0,.5); display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }',

    /* Meta */
    '.bt-card-meta { display: flex; align-items: center; gap: 6px; margin-bottom: 10px; }',
    '.bt-meta-item { display: inline-flex; align-items: center; gap: 3px; font-size: 11px; font-weight: 700; color: rgba(255,255,255,.8); text-transform: uppercase; letter-spacing: .04em; }',
    '.bt-meta-sep { color: rgba(255,255,255,.4); font-size: 10px; }',

    /* Bottom row: price + book */
    '.bt-card-bottom { display: flex; align-items: center; justify-content: space-between; gap: 8px; }',
    '.bt-card-price { color: #fff; font-size: 22px; font-weight: 900; text-shadow: 0 2px 6px rgba(0,0,0,.4); }',
    '.bt-book-btn { background: rgba(255,255,255,.12); backdrop-filter: blur(8px); color: #fff; border: 1.5px solid rgba(255,255,255,.3); font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: .1em; padding: 8px 18px; border-radius: 999px; cursor: pointer; transition: all .2s ease; }',
    '.bt-book-btn:hover { background: rgba(255,255,255,.25); border-color: rgba(255,255,255,.6); transform: translateY(-1px); }',

    /* ─── Lightbox ─── */
    '.bt-lightbox { position: fixed; inset: 0; z-index: 999999; background: rgba(0,0,0,.0); display: flex; align-items: center; justify-content: center; padding: 24px; transition: background .3s ease; }',
    '.bt-lightbox-open { background: rgba(0,0,0,.85); }',
    '.bt-lightbox-container { display: flex; max-width: 900px; max-height: 90vh; width: 100%; border-radius: 20px; overflow: hidden; background: #111; position: relative; opacity: 0; transform: scale(.92); transition: all .3s ease; }',
    '.bt-lightbox-open .bt-lightbox-container { opacity: 1; transform: scale(1); }',
    '@media (max-width: 700px) { .bt-lightbox-container { flex-direction: column; max-height: 95vh; } }',

    /* Lightbox close */
    '.bt-lightbox-close { position: absolute; top: 12px; right: 12px; z-index: 10; background: rgba(255,255,255,.15); backdrop-filter: blur(8px); border: none; border-radius: 50%; width: 40px; height: 40px; display: flex; align-items: center; justify-content: center; cursor: pointer; transition: background .2s; }',
    '.bt-lightbox-close:hover { background: rgba(255,255,255,.3); }',

    /* Lightbox video */
    '.bt-lightbox-video { flex: 1; min-width: 0; background: #000; display: flex; align-items: center; }',
    '.bt-lightbox-video video { width: 100%; max-height: 90vh; object-fit: contain; }',
    '@media (max-width: 700px) { .bt-lightbox-video { max-height: 50vh; } .bt-lightbox-video video { max-height: 50vh; } }',

    /* Lightbox info panel */
    '.bt-lightbox-info { width: 300px; flex-shrink: 0; padding: 28px 24px; display: flex; flex-direction: column; gap: 14px; background: #111; color: #fff; overflow-y: auto; }',
    '@media (max-width: 700px) { .bt-lightbox-info { width: 100%; padding: 20px; } }',
    '.bt-lightbox-cat { font-size: 10px; font-weight: 800; letter-spacing: .12em; color: rgba(255,255,255,.5); text-transform: uppercase; }',
    '.bt-lightbox-title { font-size: 22px; font-weight: 800; line-height: 1.2; }',
    '.bt-lightbox-desc { font-size: 14px; color: rgba(255,255,255,.65); line-height: 1.6; }',
    '.bt-lightbox-meta { display: flex; gap: 16px; font-size: 13px; color: rgba(255,255,255,.7); }',
    '.bt-lightbox-price-row { display: flex; align-items: center; justify-content: space-between; margin-top: auto; padding-top: 16px; border-top: 1px solid rgba(255,255,255,.1); }',
    '.bt-lightbox-price { font-size: 28px; font-weight: 900; }',
    '.bt-lightbox-book { padding: 12px 28px; border: none; border-radius: 10px; color: #fff; font-size: 14px; font-weight: 700; cursor: pointer; text-transform: uppercase; letter-spacing: .05em; transition: opacity .2s, transform .15s; }',
    '.bt-lightbox-book:hover { opacity: .88; transform: scale(1.03); }',

    /* Loading / empty / error */
    '.bt-loading { display: flex; align-items: center; justify-content: center; gap: 12px; padding: 56px 0; color: #9ca3af; font-size: 14px; }',
    '.bt-spinner { width: 22px; height: 22px; border: 2.5px solid #e5e7eb; border-top-color: #6b7280; border-radius: 50%; animation: bt-spin .7s linear infinite; }',
    '@keyframes bt-spin { to { transform: rotate(360deg); } }',
    '.bt-error, .bt-empty { text-align: center; padding: 56px 0; color: #9ca3af; font-size: 14px; }',

    /* Powered-by footer */
    '.bt-footer { display: flex; align-items: center; justify-content: center; gap: 4px; padding: 24px 0 4px; font-size: 12px; color: #b0b5bd; }',
    '.bt-footer a { display: inline-flex; align-items: center; gap: 4px; color: #9ca3af; text-decoration: none; font-weight: 500; transition: color .2s; }',
    '.bt-footer a:hover { color: #6b7280; }',
    '.bt-logo-icon { width: 16px; height: 16px; }',
  ].join('\n');

  /* ── Boot ──────────────────────────────────────────────────── */
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
