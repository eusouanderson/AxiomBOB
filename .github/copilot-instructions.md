## Copilot Instructions for AxiomBOB

### Big Picture & Purpose
AxiomBOB é um portfólio profissional e vitrine técnica para Engenheiro de Software Full Stack Sênior, focado em performance, arquitetura, escalabilidade e experiência do usuário. O projeto demonstra maturidade em engenharia, serve como referência para recrutadores e clientes, e é base para sites institucionais ou portfólios avançados.

### Arquitetura & Estrutura
- **Stack:** Vue 3 + Vite + Tailwind CSS + Pinia. Sem Vue Router (SPA-like via anchors).
- **Componentização:**
	- Layout: `src/components/layout/` (NavBar, Sidebar)
	- UI: `src/components/ui/` (ex: AnimateText, ImageSlider, LanguageToggle)
- **State:** Pinia centraliza idioma/textos (`src/store/languageStore.js`).
- **Internacionalização:** Textos em `src/text/eng/text.eng.js` e `src/text/ptbr/text.ptbr.js`. Nunca hardcode.
- **Assets:** Imagens, ícones e vídeos em `src/assets/`. Slides dinâmicos via `import.meta.glob`.
- **Estilos:** Tailwind configurado em `src/assets/input.css` → `output.css`.
- **SEO:** Estrutura pronta para SEO técnico básico.

### Estrutura Recomendada de Seções
- **Hero:** Nome, cargo, tagline técnica, call-to-action (Projetos, Contato, GitHub)
- **Sobre Mim:** História profissional, foco em engenharia, diferenciais técnicos
- **Stack Tecnológica:** Frontend, Backend, DevOps, Banco de Dados, ícones, destaque para stacks principais
- **Projetos em Destaque:** Cards com problema, solução, impacto, tecnologias, links, decisões técnicas
- **Experiência Profissional:** Linha do tempo, resultados, responsabilidades técnicas
- **Certificações & Estudos:** Certificações, cursos, conteúdo educacional
- **Contato:** LinkedIn, GitHub, e-mail, call-to-action claro

### Padrões & Diretrizes Técnicas
- **Código limpo, modular e escalável** (Atomic Design ou similar)
- **Internacionalização:** Sempre via Pinia, nunca texto fixo
- **Performance:** Prioridade máxima (lazy load, otimização de assets, animações suaves)
- **UI/UX:** Clean, dark-first, responsivo, tipografia moderna (ex: Inter, JetBrains Mono), animações CSS/GSAP
- **Componentização:** Reutilize componentes, evite duplicidade
- **Sem Vue Router:** Navegação por anchors e estado
- **Destaque visual para código, métricas e stacks**

### Fluxos de Trabalho
- **Desenvolvimento:** `pnpm dev` (Vite + Tailwind watch)
- **Build:** `pnpm build`
- **Preview:** `pnpm preview`
- **Tailwind:** `pnpm tailwind` (input.css → output.css)

### Integrações & Dependências
- Vue 3, Pinia, Tailwind CSS, FontAwesome, Splide.js, Three.js
- Plugins Vite: Vue, Tailwind (`vite.config.js`)

### Exemplos de Extensão
- Nova linguagem: crie em `src/text/`, registre em `languageStore.js`
- Novo componente: adicione em `src/components/ui/` e importe via `@/components/ui/Componente.vue`

### Referências-Chave
- Entrada: `src/main.js`
- Estado: `src/store/languageStore.js`
- Textos: `src/text/eng/text.eng.js`, `src/text/ptbr/text.ptbr.js`
- Build: `vite.config.js`, `package.json`
- Estilos: `src/assets/input.css`, `src/assets/output.css`

---
**Dica:** Considere este portfólio como se fosse avaliado por um Tech Lead ou Staff Engineer. Priorize clareza, maturidade técnica e excelência em engenharia.
(e.g., AnimateText.vue, ImageSlider.vue, LanguageToggle.vue)

State Management:

Uses Pinia (src/store/languageStore.js) for global language state and text selection.

Language resources are stored in:

src/text/eng/text.eng.js

src/text/ptbr/text.ptbr.js

Assets:

Images, icons, and videos are located under src/assets/.

The image slider dynamically loads images from
src/assets/images/slide/ using Vite’s import.meta.glob.

Styling:

Tailwind CSS is configured via src/assets/input.css.

Compiled output is generated as output.css.

Tailwind runs in watch mode during development.

Routing:

No Vue Router is used.

Navigation is handled via anchor links and component state (SPA-like behavior).

Developer Workflows

Development

Start development server:

pnpm dev


Runs Vite and Tailwind in watch mode.

Build

Production build:

pnpm build


Preview

Preview production build:

pnpm preview


Tailwind

Run Tailwind CLI manually:

pnpm tailwind


Watches input.css → output.css

Conventions & Patterns

Imports

Use the @ alias for src/ (configured in vite.config.js).

Language Handling

Always access texts through the Pinia language store.

Do not hardcode UI text inside components.

UI & Animations

Prefer reusable UI components for animations and interactions.

Keep animations subtle, performant, and consistent.

Routing Philosophy

No Vue Router by design.

Navigation relies on anchor links and layout state.

Integration & Dependencies

Core Dependencies

Vue 3

Pinia

Tailwind CSS

FontAwesome

Splide.js

Three.js

Build Tooling

Vite with Vue and Tailwind plugins

Configuration available in vite.config.js

Examples

Add a new language

Create a new file inside src/text/

Register it in languageStore.js

Add a new UI component

Place it under src/components/ui/

Import using:

@/components/ui/ComponentName.vue

References

Main entry: src/main.js

State management: src/store/languageStore.js

Text resources:

src/text/eng/text.eng.js

src/text/ptbr/text.ptbr.js

Build configuration:

vite.config.js

package.json

Styles:

src/assets/input.css

src/assets/output.css