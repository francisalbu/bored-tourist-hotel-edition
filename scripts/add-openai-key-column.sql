-- ============================================================
-- Adiciona a coluna openai_api_key à tabela hotel_config
-- ============================================================
-- Correr uma vez no Supabase Dashboard → SQL Editor
--
-- Depois de correr, vai a:
--   Table editor → hotel_config → editar a linha do hotel
--   Preenche a coluna openai_api_key com a tua OpenAI API key
--   (começa com sk-...)
--
-- O sistema usa automaticamente esta key se a variável de ambiente
-- OPENAI_API_KEY não estiver definida no Vercel.
-- ============================================================

ALTER TABLE hotel_config
  ADD COLUMN IF NOT EXISTS openai_api_key TEXT;

-- Confirma que a coluna foi adicionada
SELECT id, name, openai_api_key
FROM hotel_config
ORDER BY id;
