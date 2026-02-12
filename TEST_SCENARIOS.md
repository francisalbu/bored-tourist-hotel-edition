# 🧪 Guia de Testes - Sistema de Memórias

## 🎯 Cenários de Teste

### Teste 1: Casal Romântico (Francisco & Namorada)

**Objetivo**: Verificar captura de informações de casal e interesses românticos

```
Mensagem 1:
"Hi! I'm Francisco and I'm visiting Lisbon with my girlfriend for a romantic weekend. 
We love exploring new places together."

Resposta esperada do bot:
"What kind of vibe are you after - adventure, culture, food?"

Mensagem 2:
"We're into romantic restaurants, cocktail bars, and sunset viewpoints. 
Something special for couples!"

Resposta esperada do bot:
[Recomendações de experiências românticas + cards]

Mensagem 3:
"These look great! We especially love places with good wine."

[Após esta mensagem, o sistema deve extrair memórias]
```

**Memórias esperadas:**
```json
{
  "name": "Francisco",
  "relationshipStatus": "In a relationship (visiting with girlfriend)",
  "interests": [
    "romantic restaurants",
    "cocktail bars", 
    "sunset viewpoints",
    "wine",
    "romantic experiences"
  ],
  "summary": "Francisco is visiting Lisbon with his girlfriend for a romantic weekend...",
  "memories": [
    "Name: Francisco",
    "Traveling with girlfriend",
    "Interested in romantic restaurants and cocktail bars",
    "Loves places with good wine"
  ]
}
```

---

### Teste 2: Família com Crianças

**Objetivo**: Capturar perfil familiar e idade das crianças

```
Mensagem 1:
"Hello! We're the Johnson family from London. We have two kids, ages 5 and 8."

Mensagem 2:
"We're looking for fun family activities that are educational but entertaining for the kids. 
They love animals and interactive experiences."

Mensagem 3:
"Also, are there any good kid-friendly restaurants? The little one is a picky eater."
```

**Memórias esperadas:**
```json
{
  "name": "Johnson family",
  "relationshipStatus": "Family of 4 with children (ages 5 and 8)",
  "interests": [
    "family activities",
    "educational experiences",
    "animals",
    "interactive experiences",
    "kid-friendly restaurants"
  ],
  "summary": "The Johnson family from London is traveling with two children...",
  "memories": [
    "Family from London",
    "Two kids: 5 and 8 years old",
    "Kids love animals and interactive experiences",
    "Looking for kid-friendly restaurants (picky eater)"
  ]
}
```

---

### Teste 3: Solo Traveler Adventurous

**Objetivo**: Perfil de viajante solo aventureiro

```
Mensagem 1:
"Hi! I'm Maria, 28, traveling solo. I'm into adventure sports and outdoor activities."

Mensagem 2:
"I'd love to try paragliding or kayaking. Also interested in hiking trails with great views."

Mensagem 3:
"Budget is not an issue - I want the best experiences!"
```

**Memórias esperadas:**
```json
{
  "name": "Maria",
  "relationshipStatus": "Solo traveler",
  "interests": [
    "adventure sports",
    "outdoor activities",
    "paragliding",
    "kayaking",
    "hiking",
    "scenic views"
  ],
  "summary": "Maria (28) is a solo traveler interested in adventure sports and outdoor activities...",
  "memories": [
    "Name: Maria, age 28",
    "Traveling solo",
    "Interested in adventure: paragliding, kayaking, hiking",
    "Budget-flexible - wants premium experiences"
  ]
}
```

---

### Teste 4: Business Trip + Leisure

**Objetivo**: Perfil misto (trabalho + lazer)

```
Mensagem 1:
"I'm here for a tech conference but have 2 free evenings. What can I do?"

Mensagem 2:
"I work in tech, love good food, and want to experience the local nightlife. 
Any recommendations for after-work networking spots?"

Mensagem 3:
"Also, I'm a big fan of craft beer and live music venues."
```

**Memórias esperadas:**
```json
{
  "relationshipStatus": "Solo business traveler",
  "interests": [
    "tech",
    "good food",
    "local nightlife",
    "networking spots",
    "craft beer",
    "live music"
  ],
  "summary": "Tech professional in Lisbon for conference with limited free time...",
  "memories": [
    "Business trip (tech conference)",
    "2 free evenings available",
    "Interested in food, nightlife, networking",
    "Fan of craft beer and live music"
  ]
}
```

---

## ✅ Checklist de Validação

Após cada teste, verificar:

### 1. Captura de Dados
- [ ] Nome capturado corretamente (se mencionado)
- [ ] Relationship status identificado
- [ ] Interesses extraídos (mínimo 3)
- [ ] Summary gerado coerente
- [ ] Memórias específicas guardadas

### 2. Interface
- [ ] Botão "My Memories" aparece no header
- [ ] Badge mostra número correto de memórias
- [ ] Painel abre/fecha com toggle
- [ ] Summary exibido corretamente
- [ ] Lista de memórias formatada
- [ ] Estatísticas mostram conversation_count

### 3. Persistência
- [ ] Dados salvos no Supabase
- [ ] Refresh da página mantém memórias
- [ ] Session ID consistente (localStorage)
- [ ] Novas conversas atualizam counter

### 4. Download
- [ ] Botão "Download" funcional
- [ ] Arquivo JSON válido
- [ ] Todos os campos presentes
- [ ] Timestamp correto

---

## 🐛 Debug Tips

### Console logs importantes:
```javascript
// ChatSection.tsx linha ~280
console.log('✅ Memories updated:', parsed)

// useUserMemories.ts
console.log('Memory fetched:', memory)
console.log('Updating memory:', updates)
```

### Queries Supabase úteis:

```sql
-- Ver todas as memórias
SELECT * FROM user_memories ORDER BY updated_at DESC;

-- Ver memórias de um user específico
SELECT * FROM user_memories WHERE user_id = 'guest-session-abc123';

-- Contar conversas por user
SELECT user_id, conversation_count, last_interaction 
FROM user_memories 
ORDER BY conversation_count DESC;

-- Limpar memórias de teste
DELETE FROM user_memories WHERE user_id LIKE 'guest-session-%';
```

### Erros comuns:

**1. "Table user_memories does not exist"**
```bash
Solução: Executar supabase-setup.sql no Supabase SQL Editor
```

**2. "RLS policy violation"**
```sql
-- Desativar temporariamente
ALTER TABLE user_memories DISABLE ROW LEVEL SECURITY;
```

**3. "OpenAI API error 401"**
```bash
Solução: Verificar VITE_OPENAI_API_KEY no .env.local
```

**4. Memórias não aparecem no painel**
```javascript
// Verificar no console do browser
console.log(memory) // deve mostrar objeto com dados
```

---

## 📊 Métricas de Sucesso

Um teste bem-sucedido deve ter:

✅ **Precisão**: 80%+ das informações capturadas corretamente  
✅ **Completude**: Mínimo 3 interesses identificados  
✅ **Summary**: 2-3 frases coerentes  
✅ **Performance**: Análise < 3 segundos  
✅ **UX**: Painel abre/fecha suavemente  

---

## 🎬 Script de Teste Completo

Execute este teste para validar o sistema end-to-end:

```bash
# 1. Start dev server
npm run dev

# 2. Abrir no browser
http://localhost:5173

# 3. Testar conversa (copiar/colar no chat):
"Hi! I'm Alex and I'm here with my partner for a week. We love food tours, 
street art, and local markets. Also into photography spots with good lighting. 
Budget is around €500 for the week."

# 4. Esperar 2-3 trocas de mensagens

# 5. Clicar em "My Memories" no header

# 6. Verificar:
✓ Nome: Alex
✓ Status: Couple (with partner)
✓ Interesses: food tours, street art, markets, photography
✓ Budget: ~€500/week
✓ Summary gerado

# 7. Testar download
- Clicar "Download"
- Verificar arquivo JSON
- Confirmar dados corretos

# 8. Testar persistência
- Refresh da página
- Verificar memórias mantidas
- Enviar nova mensagem
- Confirmar conversation_count aumentou
```

---

## 🚀 Teste de Stress

Para testar robustez:

1. **Múltiplas sessões simultâneas**
   - Abrir 3-5 abas diferentes
   - Cada uma deve ter session ID único
   - Verificar isolamento de dados

2. **Conversas longas**
   - 10+ mensagens seguidas
   - Verificar performance da análise
   - Confirmar memórias não duplicam

3. **Informações conflitantes**
   ```
   Msg 1: "I'm here with my girlfriend"
   Msg 5: "Actually I'm solo now, she had to leave"
   
   → Sistema deve atualizar relationship_status
   ```

4. **Múltiplos idiomas**
   ```
   Testar em: Português, Inglês, Espanhol
   → GPT-4 deve capturar corretamente
   ```

---

**✨ Boa sorte nos testes! Qualquer problema, consulta MEMORIES_SYSTEM.md**
