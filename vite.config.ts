import path from 'path';
import { defineConfig, loadEnv, Plugin } from 'vite';
import react from '@vitejs/plugin-react';
import { createClient } from '@supabase/supabase-js';

/* ── Dev-only plugin: serves /api/widget-* so the widget demo works locally ── */
function widgetDevApi(): Plugin {
  const sb = createClient(
    'https://hnivuisqktlrusyqywaz.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw',
  );

  return {
    name: 'widget-dev-api',
    configureServer(server) {
      // GET /api/widget-experiences?hotel=xxx&limit=6&category=food
      server.middlewares.use('/api/widget-experiences', async (req, res) => {
        res.setHeader('Content-Type', 'application/json');
        res.setHeader('Access-Control-Allow-Origin', '*');
        if (req.method === 'OPTIONS') { res.statusCode = 204; res.end(); return; }

        const url = new URL(req.url || '/', 'http://localhost');
        const hotel    = url.searchParams.get('hotel') || '';
        const category = url.searchParams.get('category') || '';
        const limit    = parseInt(url.searchParams.get('limit') || '12', 10);

        try {
          const { data: hotelRow } = await sb
            .from('hotel_config')
            .select('id, name, logo_url, tagline, location, theme, features')
            .eq('id', hotel)
            .single();

          let q = sb.from('experiences').select('*').eq('is_active', true).not('video_url', 'is', null).order('display_order', { ascending: true, nullsFirst: false });
          if (category && category !== 'all') q = q.eq('category', category);
          q = q.limit(limit);
          const { data: experiences } = await q;

          res.end(JSON.stringify({
            hotel: hotelRow ? { id: hotelRow.id, name: hotelRow.name, logoUrl: hotelRow.logo_url, tagline: hotelRow.tagline, location: hotelRow.location, theme: hotelRow.theme } : null,
            experiences: experiences || [],
          }));
        } catch (e) {
          res.statusCode = 500;
          res.end(JSON.stringify({ error: 'dev api error', detail: String(e) }));
        }
      });

      // GET /api/widget-config?hotel=xxx
      server.middlewares.use('/api/widget-config', async (req, res) => {
        res.setHeader('Content-Type', 'application/json');
        res.setHeader('Access-Control-Allow-Origin', '*');
        if (req.method === 'OPTIONS') { res.statusCode = 204; res.end(); return; }

        const url   = new URL(req.url || '/', 'http://localhost');
        const hotel = url.searchParams.get('hotel') || '';

        try {
          const { data } = await sb.from('hotel_config').select('*').eq('id', hotel).single();
          if (!data) { res.statusCode = 404; res.end(JSON.stringify({ error: 'not found' })); return; }
          res.end(JSON.stringify({ id: data.id, name: data.name, logoUrl: data.logo_url, theme: data.theme }));
        } catch (e) {
          res.statusCode = 500;
          res.end(JSON.stringify({ error: String(e) }));
        }
      });
    },
  };
}

export default defineConfig(({ mode }) => {
    const env = loadEnv(mode, '.', '');
    return {
      server: {
        port: 3000,
        host: '0.0.0.0',
      },
      plugins: [react(), widgetDevApi()],
      define: {
        'process.env.API_KEY': JSON.stringify(env.GEMINI_API_KEY),
        'process.env.GEMINI_API_KEY': JSON.stringify(env.GEMINI_API_KEY)
      },
      resolve: {
        alias: {
          '@': path.resolve(__dirname, '.'),
        }
      },
      build: {
        rollupOptions: {
          input: {
            main: path.resolve(__dirname, 'index.html'),
            'widget-book': path.resolve(__dirname, 'widget/book.html'),
          },
        },
      },
    };
});
