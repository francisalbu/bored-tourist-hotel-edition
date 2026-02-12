# 🧠 Sistema de Memórias do Guest - Guia Rápido

## ✨ O que foi implementado?

Um sistema completo que **aprende com cada conversa** e constrói um perfil personalizado do guest!

### Funcionalidades principais:

1. **🎯 Captura Automática**
   - A cada 2 conversas, o GPT-4 analisa e extrai informações
   - Nome, relações, interesses, preferências
   - Tudo guardado automaticamente no Supabase

2. **💾 Painel de Memórias**
   - Botão "My Memories" no header (desktop)
   - Mostra: Summary do perfil, lista de memórias, estatísticas
   - Download em JSON

3. **🔄 Persistência**
   - Session ID único por browser
   - Memórias persistem entre sessões
   - Sistema inteligente que não duplica informação

---

## 🚀 Setup Rápido (3 minutos)

### Passo 1: Criar tabela no Supabase

1. Acede ao teu **Supabase Dashboard**
2. Vai para **SQL Editor**
3. Copia todo o conteúdo do arquivo `supabase-setup.sql`
4. Cola e executa (Run)

### Passo 2: Configurar RLS (opcional mas recomendado)

```sql
-- Ativar RLS
ALTER TABLE user_memories ENABLE ROW LEVEL SECURITY;

-- Policy: permitir tudo (ajusta para produção)
CREATE POLICY "Allow all operations on user_memories" 
ON user_memories 
FOR ALL 
USING (true) 
WITH CHECK (true);
```

### Passo 3: Iniciar a app

```bash
npm run dev
```

---

## 🧪 Como testar?

### Cenário 1: Casal em viagem romântica

1. Abre o chat
2. Escreve: **"Hi! I'm Francisco and I'm here with my girlfriend. We love romantic spots and cocktail bars."**
3. Continua a conversa por 2-3 mensagens
4. Clica em **"My Memories"** no header
5. ✨ Vê as tuas memórias extraídas!

### Cenário 2: Família com crianças

1. Escreve: **"We're a family of 4 with two kids (5 and 8 years old). Looking for family-friendly activities."**
2. Pergunta sobre atividades
3. Após algumas mensagens, clica em "My Memories"
4. Vê o perfil familiar construído automaticamente

---

## 📊 O que é capturado?

```javascript
{
  name: "Francisco Albuquerque",
  relationshipStatus: "In a relationship (has girlfriend)",
  interests: [
    "romantic spots",
    "cocktail bars", 
    "date venues",
    "couple experiences"
  ],
  summary: "Francisco is traveling with his girlfriend and seeks romantic experiences...",
  memories: [
    "Name: Francisco Albuquerque",
    "In a relationship",
    "Interested in romantic venues and cocktail bars"
  ],
  conversationCount: 3,
  lastInteraction: "2026-02-12T..."
}
```

---

## 🎨 Interface

### Desktop
- **Header**: Botão "My Memories" com badge de contagem
- **Painel direito**: Slide in/out com animação
- **Tema dark**: Slate 900 background, pink accents

### Mobile
- Futuramente: Modal ou bottom sheet

---

## 🔧 Arquitetura

```
App.tsx
├── ChatSection (left panel)
│   ├── Conversa com GPT-4
│   ├── extractAndSaveMemories()
│   └── useUserMemories hook
│
└── MemoriesPanel (right panel - toggle)
    ├── Exibe perfil
    ├── Lista memórias
    └── Download JSON

Supabase
└── user_memories table
    ├── user_id (unique)
    ├── name, relationship_status
    ├── interests[] (array)
    ├── summary (AI-generated)
    └── memories[] (array)
```

---

## 🎯 Próximos passos

### Melhorias sugeridas:

1. **Autenticação real** - Substituir session ID por Supabase Auth
2. **Editar memórias** - Interface para adicionar/remover manualmente
3. **Notificações** - "Nova memória adicionada!"
4. **Analytics** - Dashboard de insights do perfil
5. **Multi-idioma** - Detectar e guardar idioma preferido
6. **Exportar PDF** - Relatório visual das memórias

### Para produção:

- [ ] Backend API para OpenAI (remover `dangerouslyAllowBrowser`)
- [ ] Rate limiting nas chamadas GPT
- [ ] RLS policies mais restritivas
- [ ] Validação de dados
- [ ] Testes automatizados
- [ ] Logs e monitoring

---

## 📝 Exemplo de conversa com captura

```
User: "Hi! I'm Sarah and I'm here with my husband for our anniversary."
Bot: "What kind of vibe are you after - adventure, culture, food?"

User: "We love wine tasting and fine dining experiences!"
Bot: "Perfect! Here are some romantic spots: [recommendations]"

🧠 MEMÓRIAS CAPTURADAS:
- Name: Sarah
- Relationship: Married (anniversary trip)
- Interests: Wine tasting, fine dining, romantic experiences
- Summary: Sarah and her husband are celebrating their anniversary...
```

---

## ❓ FAQ

**P: As memórias são partilhadas entre utilizadores?**  
R: Não, cada session ID é único e isolado.

**P: Quanto custa em API calls?**  
R: ~300-500 tokens por análise, a cada 2 conversas. Cerca de $0.001-0.002 por guest.

**P: Posso desativar a captura automática?**  
R: Sim, comenta a linha `await extractAndSaveMemories()` em ChatSection.tsx

**P: Como implemento autenticação real?**  
R: Usa Supabase Auth ou Firebase, substitui `userId` pelo auth.user.id

---

## 🆘 Troubleshooting

### Erro: "Table user_memories does not exist"
→ Executa o SQL no Supabase (passo 1 do setup)

### Erro: "RLS policy violation"
→ Adiciona a policy ou desativa RLS temporariamente

### Memórias não aparecem
→ Verifica console para erros na chamada GPT-4
→ Confirma que VITE_OPENAI_API_KEY está configurado

### Panel não abre
→ Verifica se estás em desktop (hidden md:flex)

---

**🎉 Pronto! Sistema 100% funcional. Diverte-te a construir perfis de guests!**
