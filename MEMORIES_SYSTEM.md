# Sistema de Memórias do Guest - Implementação Completa

## 🎯 O que foi implementado

Criámos um sistema completo de **memórias do usuário** que:

1. **Captura automaticamente** informações das conversas no chat
2. **Extrai com IA** (GPT-4) dados relevantes: nome, relações, interesses, preferências
3. **Armazena no Supabase** em tabela dedicada `user_memories`
4. **Exibe num painel** lateral estilo "MEMORIES" (como na imagem de referência)
5. **Permite download** de todas as memórias em JSON

## 📋 Setup - IMPORTANTE

### 1. Criar a tabela no Supabase

Acede ao teu projeto Supabase e executa o SQL abaixo no **SQL Editor**:

```sql
-- User Memories Table
CREATE TABLE IF NOT EXISTS user_memories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id TEXT NOT NULL UNIQUE,
  name TEXT,
  relationship_status TEXT,
  interests TEXT[],
  summary TEXT,
  memories TEXT[] DEFAULT '{}',
  conversation_count INTEGER DEFAULT 0,
  last_interaction TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_user_memories_user_id ON user_memories(user_id);
CREATE INDEX IF NOT EXISTS idx_user_memories_updated_at ON user_memories(updated_at DESC);

-- Update timestamp function
CREATE OR REPLACE FUNCTION update_user_memories_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
DROP TRIGGER IF EXISTS update_user_memories_timestamp ON user_memories;
CREATE TRIGGER update_user_memories_timestamp
BEFORE UPDATE ON user_memories
FOR EACH ROW
EXECUTE FUNCTION update_user_memories_timestamp();
```

### 2. Configurar permissões RLS (Row Level Security)

No Supabase, vai a **Authentication > Policies** e adiciona:

```sql
-- Enable RLS
ALTER TABLE user_memories ENABLE ROW LEVEL SECURITY;

-- Policy: Allow all operations (ajusta conforme necessário)
CREATE POLICY "Allow all operations on user_memories" 
ON user_memories 
FOR ALL 
USING (true) 
WITH CHECK (true);
```

> **Nota**: Esta policy permite acesso total. Para produção, implementa autenticação adequada.

## 🚀 Como funciona

### Fluxo de captura de memórias

1. **Usuário conversa com o concierge** no chat
2. **A cada 2 mensagens**, o sistema envia o histórico da conversa para GPT-4
3. **GPT-4 extrai informações** estruturadas (JSON):
   - Nome do guest
   - Status de relacionamento (sozinho, casal, família)
   - Interesses (atividades, tipos de experiências)
   - Summary do perfil
   - Memórias específicas

4. **Dados são salvos no Supabase** automaticamente
5. **Memórias são mescladas** com as existentes (sem duplicação)

### Interface

- **Botão "My Memories"** no header (desktop) - mostra badge com contagem
- **Painel lateral direito** exibe:
  - Summary do perfil
  - Lista de memórias
  - Estatísticas (nº conversas, última interação)
  - Botões: "Add more" e "Download"

## 📁 Arquivos criados/modificados

### Novos arquivos:
- `types.ts` - Tipos `UserMemory` e `UserMemoryDisplay`
- `hooks/useUserMemories.ts` - Hook para gerir memórias
- `components/MemoriesPanel.tsx` - Interface do painel de memórias
- `supabase-setup.sql` - Script SQL para criar tabela

### Modificados:
- `App.tsx` - Integração do painel de memórias com toggle
- `components/ChatSection.tsx` - Lógica de captura e extração de memórias

## 🎨 Funcionalidades

### ✅ Captura Automática
- Sistema analisa conversas a cada 2 interações
- Extração inteligente com GPT-4
- Merge automático sem duplicação

### ✅ Perfil Dinâmico
- Nome do guest
- Relação (solo, casal, família, amigos)
- Lista de interesses
- Summary personalizado

### ✅ Privacidade
- Mensagem sobre transparência
- Botão de download das memórias
- Possibilidade futura: deletar memórias individuais

### ✅ Persistência
- Sessão única por browser (localStorage)
- Dados persistem entre sessões
- Histórico completo de interações

## 💡 Melhorias futuras

1. **Autenticação real** - Substituir session ID por auth Supabase/Firebase
2. **Deletar memórias** - Permitir remover memórias individuais
3. **Editar manualmente** - Interface para adicionar/editar memórias
4. **Notificações** - Alertar quando novas memórias são criadas
5. **Exportar PDF** - Além de JSON, exportar relatório visual
6. **Métricas** - Dashboard com estatísticas de uso
7. **Multi-idioma** - Capturar idioma preferido do guest

## 🧪 Como testar

1. Execute o SQL no Supabase para criar a tabela
2. Inicie a aplicação: `npm run dev`
3. Converse com o concierge sobre:
   - Quem você é
   - Com quem está viajando
   - O que gosta de fazer
   - Preferências de atividades
4. Após 2-3 mensagens, clique em **"My Memories"** no header
5. Veja o painel com suas informações extraídas!

## 🔐 Segurança

⚠️ **Atenção**: O código atual usa `dangerouslyAllowBrowser: true` para OpenAI.

Para **produção**, implementa:
- Backend API (Node.js/Express) para chamadas OpenAI
- Autenticação adequada (JWT, Supabase Auth)
- Rate limiting
- Validação de dados
- RLS policies mais restritivas

## 📊 Estrutura de dados

```typescript
interface UserMemory {
  id: string
  user_id: string
  name?: string
  relationship_status?: string
  interests?: string[]
  summary?: string
  memories: string[]
  conversation_count: number
  last_interaction?: string
  created_at: string
  updated_at: string
}
```

## 🎯 Exemplo de memórias extraídas

```json
{
  "name": "Francisco Albuquerque",
  "relationshipStatus": "In a relationship (has girlfriend)",
  "interests": [
    "date spots",
    "romantic venues",
    "cocktail bars",
    "couple experiences"
  ],
  "summary": "Francisco Albuquerque is a direct communicator in a relationship who seeks romantic experiences for dates with his girlfriend. He's interested in date spots, cocktail bars, and unique couple experiences.",
  "memories": [
    "Name: Francisco Albuquerque",
    "In a relationship (has girlfriend)",
    "Interested in: date spots, romantic venues, cocktail bars, couple experiences"
  ]
}
```

---

✨ **Sistema pronto para usar! Qualquer dúvida, pergunta-me.**
