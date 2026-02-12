<div align="center">
<img width="1200" height="475" alt="GHBanner" src="https://github.com/user-attachments/assets/0aa67016-6eaf-458a-adb2-6e31a0763ed6" />
</div>

# Bored Tourist - Hotel Edition 🏨

**AI-Powered Concierge with Guest Memory System**

Uma plataforma de experiências turísticas para hotéis com sistema inteligente de perfis de hóspedes que aprende com cada interação.

## ✨ Novidades: Sistema de Memórias do Guest

🧠 **Perfis Personalizados Automáticos** - O sistema analisa conversas e constrói perfis detalhados de cada hóspede  
💾 **Persistência Inteligente** - Memórias guardadas no Supabase e acessíveis entre sessões  
📊 **Painel Visual** - Interface dedicada para visualizar e gerir memórias  
📥 **Download de Dados** - Guests podem descarregar todas as suas informações  

### Como funciona:
1. Guest conversa com o concierge AI
2. A cada 2-3 mensagens, GPT-4 analisa e extrai informações
3. Nome, interesses, preferências são guardados automaticamente
4. Perfil é atualizado dinamicamente em tempo real

[Ver documentação completa →](QUICKSTART_MEMORIES.md)

---

## 🚀 Run Locally

**Prerequisites:** Node.js 18+, Supabase Account

1. **Clone e instala dependências:**
   ```bash
   npm install
   ```

2. **Configura variáveis de ambiente (.env.local):**
   ```bash
   VITE_OPENAI_API_KEY=your-openai-key-here
   VITE_SUPABASE_URL=your-supabase-url
   VITE_SUPABASE_ANON_KEY=your-supabase-anon-key
   ```

3. **Setup Supabase (OBRIGATÓRIO para memórias):**
   - Acede ao teu projeto Supabase
   - Vai para SQL Editor
   - Executa o script em [supabase-setup.sql](supabase-setup.sql)

4. **Inicia a aplicação:**
   ```bash
   npm run dev
   ```

5. **Acede:** http://localhost:5173

---

## 📂 Estrutura do Projeto

```
bored-tourist---hotel-edition/
├── components/
│   ├── ChatSection.tsx       # Concierge AI + Captura de memórias
│   ├── MemoriesPanel.tsx     # Interface de visualização de perfis
│   ├── VideoCard.tsx
│   ├── DetailModal.tsx
│   └── CategoryFilter.tsx
├── hooks/
│   ├── useExperiences.ts
│   └── useUserMemories.ts    # Hook para gerir memórias
├── lib/
│   └── supabase.ts
├── App.tsx                    # Main app + Toggle de memórias
├── types.ts                   # UserMemory types incluídos
└── supabase-setup.sql         # Script SQL para tabela user_memories
```

---

## 🧠 Sistema de Memórias - Quick Guide

### O que é capturado?

```typescript
interface UserMemory {
  name?: string                    // Nome do guest
  relationship_status?: string     // Solo, casal, família, etc.
  interests?: string[]             // Lista de interesses
  summary?: string                 // AI-generated summary
  memories: string[]               // Factos específicos
  conversation_count: number       // Nº de interações
  last_interaction?: string        // Última atividade
}
```

### Exemplo real:

```json
{
  "name": "Francisco Albuquerque",
  "relationshipStatus": "In a relationship (has girlfriend)",
  "interests": ["romantic venues", "cocktail bars", "couple experiences"],
  "summary": "Francisco is traveling with his girlfriend seeking romantic experiences...",
  "memories": [
    "Name: Francisco Albuquerque",
    "In a relationship",
    "Interested in date spots and cocktail bars"
  ],
  "conversationCount": 3
}
```

### Funcionalidades:

✅ Captura automática a cada 2 conversas  
✅ Extração com GPT-4 (modelo turbo)  
✅ Merge inteligente (sem duplicação)  
✅ Painel visual dark theme  
✅ Download em JSON  
✅ Persistência entre sessões  

---

## 📚 Documentação

- **[QUICKSTART_MEMORIES.md](QUICKSTART_MEMORIES.md)** - Guia rápido do sistema de memórias
- **[MEMORIES_SYSTEM.md](MEMORIES_SYSTEM.md)** - Documentação técnica completa
- **[TEST_SCENARIOS.md](TEST_SCENARIOS.md)** - Cenários de teste e validação
- **[ARCHITECTURE_DIAGRAM.txt](ARCHITECTURE_DIAGRAM.txt)** - Diagrama visual da arquitetura
- **[SUPABASE_INTEGRATION.md](SUPABASE_INTEGRATION.md)** - Guia de integração Supabase

---

## 🎯 Funcionalidades Principais

### 1. Concierge AI (GPT-4)
- Conversação natural em tempo real
- Recomendações personalizadas baseadas em interesses
- Agrupamento geográfico inteligente
- Sugestões de itinerários

### 2. Catálogo de Experiências
- Integração com Supabase
- Filtros por categoria
- Cards visuais com imagens
- Modal de detalhes completo

### 3. Free Spots
- 8+ spots gratuitos em Lisboa
- Cards diferenciados (border azul)
- Informações de localização e distância

### 4. Sistema de Memórias 🆕
- Captura automática via GPT-4
- Perfil dinâmico do guest
- Interface visual dedicada
- Download de dados

---

## 🛠️ Tech Stack

- **Frontend:** React 19 + TypeScript + Vite
- **Styling:** Tailwind CSS
- **AI:** OpenAI GPT-4 Turbo
- **Database:** Supabase (PostgreSQL)
- **Icons:** Lucide React
- **Deployment:** Vercel

---

## 📊 Custo Estimado (API)

Por guest (sessão média 6-10 mensagens):
- Conversas: ~$0.006-0.010
- Análise de memórias: ~$0.006-0.010
- **Total:** ~$0.012-0.020 por guest (~1-2 cêntimos)

100 guests/dia = **$1.20-2.00/dia** = $36-60/mês

---

## 🔐 Segurança & Privacidade

✅ Transparência total com o guest  
✅ Download de dados pessoais  
✅ Session ID único e isolado  
✅ Row Level Security (Supabase)  

⚠️ **Para Produção:**
- Implementar backend API para OpenAI
- Substituir `dangerouslyAllowBrowser`
- Adicionar autenticação real (Supabase Auth)
- Rate limiting e validação
- GDPR compliance

---

## 🧪 Testar o Sistema

```bash
# 1. Iniciar app
npm run dev

# 2. Conversar no chat
"Hi! I'm Alex, here with my partner. We love food tours and local markets."

# 3. Após 2-3 mensagens, clicar "My Memories" no header

# 4. Verificar perfil capturado
✓ Nome: Alex
✓ Status: Couple
✓ Interesses: food tours, markets
✓ Summary gerado automaticamente
```

Ver cenários completos em [TEST_SCENARIOS.md](TEST_SCENARIOS.md)

---

## 📞 Suporte

- **Issues:** GitHub Issues
- **Documentação:** Ver arquivos `.md` na raiz
- **Email:** francisco@boredtourist.com

---

## 📜 License

Proprietary - Bored Tourist © 2024-2026

---

**🎉 Sistema de memórias 100% funcional e pronto para uso!**
