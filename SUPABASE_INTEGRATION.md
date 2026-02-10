# 🔌 Integração Supabase - Bored Tourist Hotel Edition

## ✅ Integração Completa

A aplicação está agora totalmente integrada com o Supabase e busca dados reais da base de dados.

### 📦 O que foi implementado:

#### 1. **Cliente Supabase** (`lib/supabase.ts`)
- Configuração do cliente com URL e Service Role Key
- Pronto para fazer queries à base de dados

#### 2. **Tipos TypeScript** (`types.ts`)
- `Experience`: Interface que corresponde ao schema da tabela `experiences`
- `ExperienceDisplay`: Interface para apresentação no frontend
- Todos os campos da BD mapeados corretamente

#### 3. **Hooks Customizados** (`hooks/useExperiences.ts`)
- `useExperiences()`: Fetch automático de todas as experiências ativas
  - Loading states
  - Error handling
  - Filtro por `is_active = true`
  
- `useCategories()`: Extração dinâmica de categorias únicas
  - Categorias detectadas automaticamente da BD
  - Icons mapeados por categoria

#### 4. **Componentes Atualizados**
- **App.tsx**: Usa dados reais do Supabase com loading/error states
- **VideoCard.tsx**: Compatível com nova estrutura de dados
- **DetailModal.tsx**: Modal completo com todas as informações:
  - Vídeo do bucket media (Google Cloud Storage)
  - Título, descrição, localização
  - Duração, rating, preço
  - Highlights (se disponíveis)
  - Informações importantes
  - Política de cancelamento
  - Endereço/meeting point
  - Max group size
  - CTA "Book Now"

### 🎥 Vídeos do Google Cloud Storage

Os vídeos são carregados diretamente do campo `video_url` da tabela `experiences`. 
- Se o vídeo existir, é reproduzido no card (hover) e no modal (autoplay)
- Se não existir, mostra apenas a imagem (`image_url`)

### 🏗️ Estrutura de Dados Esperada

A aplicação busca da tabela `experiences` com os seguintes campos principais:

```typescript
{
  id: string
  title: string
  description: string
  category: string
  price: number
  currency: string
  rating: number
  location: string
  address: string
  image_url: string
  video_url?: string
  duration: string
  highlights?: string[]
  max_group_size?: number
  cancellation_policy?: string
  important_info?: string
  is_active: boolean
}
```

### 🔐 Segurança

⚠️ **IMPORTANTE**: Atualmente está a usar a **Service Role Key** no frontend, o que não é recomendado para produção.

**Para produção, deves:**
1. Usar a **Anon/Public Key** no frontend
2. Configurar Row Level Security (RLS) no Supabase
3. Criar políticas para permitir leitura pública das experiências ativas

### 🚀 Como Usar

1. **Iniciar desenvolvimento:**
   ```bash
   npm run dev
   ```

2. **A aplicação irá:**
   - Buscar experiências ativas da BD
   - Detectar categorias automaticamente
   - Mostrar loading enquanto carrega
   - Exibir erros se houver problemas de conexão

### 🎨 Filtros White Label

Para adicionar filtro por hotel específico:

```typescript
// Em hooks/useExperiences.ts, adicionar:
.eq('hotel_id', 'SEU_HOTEL_ID')
```

Ou criar uma configuração:
```typescript
const HOTEL_CONFIG = {
  id: 'hotel-xyz',
  name: 'Hotel Name',
  // ... outras configs
};
```

### 📊 Próximos Passos (Opcional)

- [ ] Adicionar filtro por hotel (white label)
- [ ] Implementar sistema de reviews (buscar da tabela `reviews`)
- [ ] Adicionar favoritos (integrar com `favorites`)
- [ ] Sistema de bookings (integrar com `bookings`)
- [ ] Optimistic UI updates
- [ ] Cache com React Query ou SWR
- [ ] Implementar RLS para segurança
- [ ] Usar Anon Key em vez de Service Role Key

---

**Status**: ✅ Integração funcional e pronta para testes
