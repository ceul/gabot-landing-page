# Landing Page Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the current dark-purple custom-CSS landing page with a responsive light-mode blue-scheme page matching the two Stitch designs (Desktop + Móvil).

**Architecture:** Single `index.html` file using Tailwind CSS CDN for styling, Material Symbols Outlined for icons, Space Grotesk + Inter fonts. Desktop layout uses a top nav and standard sections; mobile adds a fixed bottom navigation bar. Both share the same Tailwind color tokens from the Stitch design system.

**Tech Stack:** HTML5, Tailwind CSS CDN, Google Fonts (Space Grotesk + Inter), Material Symbols Outlined, vanilla JS

---

## File Map

| File | Action |
|------|--------|
| `gabot-landing-page/index.html` | **Full rewrite** — replace all content |

Reference sources (read-only, do not modify):
- `/tmp/gabot-desktop.html` — Desktop Stitch design
- `/tmp/gabot-mobile-light.html` — Mobile Stitch design

---

### Task 1: Document Shell — `<head>`, SEO meta, Tailwind config

**Files:**
- Modify: `gabot-landing-page/index.html` (replace entire file)

- [ ] **Step 1: Write the new shell**

Replace `index.html` with the following (everything from `<!DOCTYPE html>` through the opening `<body>` tag):

```html
<!DOCTYPE html>
<html class="light" lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />

  <!-- ═══ PRIMARY SEO ═══ -->
  <title>Gabot — Bot de WhatsApp con IA para Restaurantes | Automatiza Pedidos 24/7</title>
  <meta name="description" content="Gabot es el bot de WhatsApp con IA que automatiza los pedidos de tu restaurante 24/7. Gestiona más de 500 pedidos/día, reduce errores y aumenta tus ingresos — configúralo en menos de 30 minutos. Comienza gratis." />
  <meta name="keywords" content="bot IA restaurante, bot de pedidos WhatsApp, automatización restaurante, IA para pedidos de comida, chatbot para restaurantes, bot WhatsApp business, sistema de pedidos restaurante, toma de pedidos automatizada" />
  <meta name="robots" content="index, follow" />
  <meta name="author" content="Gabot AI" />
  <link rel="canonical" href="https://gabot.ai/" />

  <!-- ═══ OPEN GRAPH ═══ -->
  <meta property="og:type" content="website" />
  <meta property="og:url" content="https://gabot.ai/" />
  <meta property="og:title" content="Gabot — Bot de WhatsApp con IA que Nunca Pierde un Pedido" />
  <meta property="og:description" content="Automatiza los pedidos de WhatsApp de tu restaurante con IA que habla con naturalidad. 500+ pedidos/día, 98% de precisión, cero pedidos perdidos. Configúralo en 30 minutos." />
  <meta property="og:image" content="https://gabot.ai/og-image.png" />
  <meta property="og:image:width" content="1200" />
  <meta property="og:image:height" content="630" />
  <meta property="og:site_name" content="Gabot AI" />
  <meta property="og:locale" content="es_ES" />

  <!-- ═══ TWITTER CARD ═══ -->
  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:site" content="@gabotai" />
  <meta name="twitter:title" content="Gabot — Bot de WhatsApp con IA para Restaurantes" />
  <meta name="twitter:description" content="El mejor empleado de tu restaurante — nunca duerme, nunca olvida un pedido. Pedidos por WhatsApp con IA que funciona 24/7." />
  <meta name="twitter:image" content="https://gabot.ai/og-image.png" />

  <!-- ═══ STRUCTURED DATA ═══ -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "Organization",
        "@id": "https://gabot.ai/#organization",
        "name": "Gabot AI",
        "url": "https://gabot.ai",
        "logo": { "@type": "ImageObject", "url": "https://gabot.ai/logo.png" },
        "description": "Automatización de pedidos por WhatsApp con IA para restaurantes",
        "contactPoint": { "@type": "ContactPoint", "contactType": "sales", "email": "hello@gabot.ai" },
        "sameAs": ["https://twitter.com/gabotai"]
      },
      {
        "@type": "SoftwareApplication",
        "@id": "https://gabot.ai/#software",
        "name": "Gabot",
        "applicationCategory": "BusinessApplication",
        "operatingSystem": "Web, WhatsApp",
        "url": "https://gabot.ai",
        "description": "Bot de WhatsApp con IA que automatiza la toma de pedidos en restaurantes 24/7.",
        "offers": [
          { "@type": "Offer", "name": "Starter", "price": "29", "priceCurrency": "USD", "billingDuration": "P1M" },
          { "@type": "Offer", "name": "Professional", "price": "79", "priceCurrency": "USD", "billingDuration": "P1M" }
        ],
        "aggregateRating": { "@type": "AggregateRating", "ratingValue": "4.9", "reviewCount": "400", "bestRating": "5" }
      },
      {
        "@type": "FAQPage",
        "mainEntity": [
          {
            "@type": "Question",
            "name": "¿Cuánto tiempo tarda la configuración de Gabot?",
            "acceptedAnswer": { "@type": "Answer", "text": "Gabot puede estar funcionando en menos de 15 minutos. Solo sube el PDF de tu menú, conecta tu cuenta de WhatsApp Business y la IA empieza a tomar pedidos de inmediato." }
          },
          {
            "@type": "Question",
            "name": "¿Gabot funciona con mi sistema POS existente?",
            "acceptedAnswer": { "@type": "Answer", "text": "Sí. Gabot se integra directamente con tu POS o panel personalizado para procesar pagos y enviar pedidos en tiempo real. Disponible en los planes Professional y Enterprise." }
          },
          {
            "@type": "Question",
            "name": "¿Hay una prueba gratuita?",
            "acceptedAnswer": { "@type": "Answer", "text": "Sí, Gabot ofrece una prueba gratuita para que puedas experimentar todo el poder de la automatización de pedidos con IA antes de comprometerte con un plan." }
          }
        ]
      }
    ]
  }
  </script>

  <!-- ═══ FONTS ═══ -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Space+Grotesk:wght@500;600;700&display=swap" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet" />

  <!-- ═══ TAILWIND ═══ -->
  <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
  <script>
    tailwind.config = {
      darkMode: "class",
      theme: {
        extend: {
          colors: {
            "surface-container":         "#e5eeff",
            "surface":                   "#f8f9ff",
            "surface-container-high":    "#dce9ff",
            "primary-container":         "#2170e4",
            "on-tertiary-container":     "#fbfdff",
            "background":                "#f8f9ff",
            "on-secondary-container":    "#586377",
            "on-secondary":              "#ffffff",
            "primary-fixed":             "#d8e2ff",
            "tertiary-fixed-dim":        "#c4c7c9",
            "secondary-container":       "#d5e0f8",
            "tertiary-container":        "#727577",
            "on-primary":                "#ffffff",
            "on-tertiary":               "#ffffff",
            "primary":                   "#0058be",
            "surface-dim":               "#cbdbf5",
            "on-tertiary-fixed-variant": "#444749",
            "on-secondary-fixed-variant":"#3c475a",
            "primary-fixed-dim":         "#adc6ff",
            "on-primary-container":      "#fefcff",
            "on-secondary-fixed":        "#111c2d",
            "surface-variant":           "#d3e4fe",
            "secondary":                 "#545f73",
            "on-background":             "#0b1c30",
            "on-surface":                "#0b1c30",
            "on-error-container":        "#93000a",
            "tertiary":                  "#595c5e",
            "secondary-fixed-dim":       "#bcc7de",
            "outline-variant":           "#c2c6d6",
            "surface-container-highest": "#d3e4fe",
            "secondary-fixed":           "#d8e3fb",
            "error-container":           "#ffdad6",
            "inverse-surface":           "#213145",
            "on-primary-fixed-variant":  "#004395",
            "on-primary-fixed":          "#001a42",
            "tertiary-fixed":            "#e0e3e5",
            "on-surface-variant":        "#424754",
            "surface-container-lowest":  "#ffffff",
            "on-tertiary-fixed":         "#191c1e",
            "surface-container-low":     "#eff4ff",
            "inverse-on-surface":        "#eaf1ff",
            "on-error":                  "#ffffff",
            "inverse-primary":           "#adc6ff",
            "surface-tint":              "#005ac2",
            "surface-bright":            "#f8f9ff",
            "outline":                   "#727785",
            "error":                     "#ba1a1a"
          },
          borderRadius: {
            "DEFAULT": "0.25rem",
            "lg":      "0.5rem",
            "xl":      "0.75rem",
            "2xl":     "1rem",
            "3xl":     "1.5rem",
            "full":    "9999px"
          },
          spacing: {
            "base":           "8px",
            "sm":             "12px",
            "margin-mobile":  "16px",
            "margin-desktop": "48px",
            "xs":             "4px",
            "gutter":         "24px",
            "md":             "24px",
            "lg":             "48px",
            "xl":             "80px"
          },
          fontFamily: {
            "headline-xl": ["Space Grotesk", "sans-serif"],
            "headline-lg": ["Space Grotesk", "sans-serif"],
            "headline-md": ["Space Grotesk", "sans-serif"],
            "headline-sm": ["Space Grotesk", "sans-serif"],
            "label-md":    ["Space Grotesk", "sans-serif"],
            "label-sm":    ["Space Grotesk", "sans-serif"],
            "body-lg":     ["Inter", "sans-serif"],
            "body-md":     ["Inter", "sans-serif"],
            "body-sm":     ["Inter", "sans-serif"]
          },
          fontSize: {
            "headline-xl": ["40px",  { lineHeight: "48px",  letterSpacing: "-0.02em", fontWeight: "700" }],
            "headline-lg": ["32px",  { lineHeight: "40px",  letterSpacing: "-0.01em", fontWeight: "600" }],
            "headline-md": ["24px",  { lineHeight: "32px",  fontWeight: "600" }],
            "headline-sm": ["20px",  { lineHeight: "28px",  fontWeight: "500" }],
            "label-md":    ["14px",  { lineHeight: "16px",  letterSpacing: "0.05em", fontWeight: "500" }],
            "label-sm":    ["12px",  { lineHeight: "14px",  fontWeight: "500" }],
            "body-lg":     ["18px",  { lineHeight: "28px",  fontWeight: "400" }],
            "body-md":     ["16px",  { lineHeight: "24px",  fontWeight: "400" }],
            "body-sm":     ["14px",  { lineHeight: "20px",  fontWeight: "400" }]
          }
        }
      }
    }
  </script>

  <style>
    /* Dot-grid background texture */
    body {
      background-color: #f8f9ff;
      background-image: radial-gradient(circle at 1px 1px, #cbd5e1 1px, transparent 0);
      background-size: 40px 40px;
      scroll-behavior: smooth;
    }
    .material-symbols-outlined {
      font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
      font-style: normal;
    }
    .material-symbols-outlined.filled {
      font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
    }
    .circuit-line {
      background: linear-gradient(90deg, #0058be 50%, transparent 50%);
      background-size: 20px 1px;
    }
    .glass-nav {
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
    }
    .bento-card {
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .bento-card:hover {
      transform: translateY(-4px);
      box-shadow: 0 10px 30px -10px rgba(0, 88, 190, 0.15);
    }
    /* Step connector line (desktop how-it-works) */
    .step-connector::after {
      content: '';
      position: absolute;
      top: 50%;
      left: 100%;
      width: 100%;
      height: 2px;
      background: #d3e4fe;
      z-index: -1;
    }
    @media (max-width: 768px) {
      .step-connector::after { display: none; }
    }
    /* Bottom nav safe area */
    .pb-safe { padding-bottom: env(safe-area-inset-bottom, 0px); }
  </style>
</head>
<body class="font-body-md text-on-surface selection:bg-primary-container selection:text-on-primary-container">
```

- [ ] **Step 2: Open index.html in browser, verify:**
  - Page background is light (off-white `#f8f9ff`) with subtle dot grid
  - No content visible yet (empty body)
  - No console errors

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — document shell with Tailwind + Stitch tokens"
```

---

### Task 2: Navigation Bar

**Files:**
- Modify: `gabot-landing-page/index.html` — append after `<body>` opening tag

The nav is fixed at the top. On desktop it shows logo + links + CTA. On mobile it shows logo + hamburger (mobile links panel toggled by JS in Task 12).

- [ ] **Step 1: Add the navigation HTML**

Append immediately after `<body ...>`:

```html
<!-- ═══ NAVIGATION ═══ -->
<nav id="main-nav" class="glass-nav fixed top-0 w-full z-50 bg-surface/80 border-b border-outline-variant/30 shadow-sm" role="navigation" aria-label="Navegación principal">
  <div class="flex justify-between items-center h-16 md:h-20 px-margin-mobile md:px-margin-desktop max-w-7xl mx-auto">

    <!-- Logo -->
    <a href="/" class="flex items-center gap-2" aria-label="Gabot — Inicio">
      <span class="material-symbols-outlined filled text-primary text-headline-md">smart_toy</span>
      <span class="font-headline-md text-headline-md font-bold text-primary">Gabot</span>
    </a>

    <!-- Desktop links -->
    <div class="hidden md:flex items-center gap-lg" role="menubar">
      <a class="font-label-md text-label-md text-on-surface-variant hover:text-primary transition-colors" href="#features" role="menuitem">Características</a>
      <a class="font-label-md text-label-md text-on-surface-variant hover:text-primary transition-colors" href="#how-it-works" role="menuitem">Cómo Funciona</a>
      <a class="font-label-md text-label-md text-on-surface-variant hover:text-primary transition-colors" href="#pricing" role="menuitem">Precios</a>
      <a class="font-label-md text-label-md text-on-surface-variant hover:text-primary transition-colors" href="#testimonials" role="menuitem">Testimonios</a>
    </div>

    <!-- Desktop actions -->
    <div class="hidden md:flex items-center gap-md">
      <button class="font-label-md text-label-md text-on-surface-variant px-md py-base hover:text-primary transition-colors">Iniciar Sesión</button>
      <a href="#contact" class="bg-primary text-on-primary font-label-md text-label-md px-lg py-base rounded-lg shadow-sm hover:opacity-90 transition-all">Empezar Ahora</a>
    </div>

    <!-- Mobile hamburger -->
    <button id="nav-toggle" class="md:hidden text-on-surface-variant hover:text-primary transition-colors p-2" aria-label="Abrir menú" aria-expanded="false" aria-controls="mobile-menu">
      <span class="material-symbols-outlined">menu</span>
    </button>
  </div>

  <!-- Mobile dropdown menu -->
  <div id="mobile-menu" class="hidden md:hidden bg-surface/95 backdrop-blur-md border-t border-outline-variant/30 px-margin-mobile py-md" role="menu">
    <div class="flex flex-col gap-sm">
      <a class="font-label-md text-label-md text-on-surface-variant hover:text-primary py-sm transition-colors" href="#features" role="menuitem">Características</a>
      <a class="font-label-md text-label-md text-on-surface-variant hover:text-primary py-sm transition-colors" href="#how-it-works" role="menuitem">Cómo Funciona</a>
      <a class="font-label-md text-label-md text-on-surface-variant hover:text-primary py-sm transition-colors" href="#pricing" role="menuitem">Precios</a>
      <a class="font-label-md text-label-md text-on-surface-variant hover:text-primary py-sm transition-colors" href="#testimonials" role="menuitem">Testimonios</a>
      <a href="#contact" class="mt-sm bg-primary text-on-primary font-label-md text-label-md px-lg py-base rounded-lg text-center hover:opacity-90 transition-all">Empezar Ahora</a>
    </div>
  </div>
</nav>

<main class="pt-16 md:pt-20" id="main-content">
```

- [ ] **Step 2: Verify in browser:**
  - Nav bar appears fixed at top, white/translucent background
  - "Gabot" logo in blue with robot icon on left
  - Desktop: 4 nav links + "Iniciar Sesión" + blue "Empezar Ahora" button
  - Mobile (viewport < 768px): only logo + hamburger icon visible
  - Nav links are invisible on mobile until hamburger clicked (JS not wired yet)

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — navigation bar"
```

---

### Task 3: Hero Section

**Files:**
- Modify: `gabot-landing-page/index.html` — append inside `<main>`

The hero has a two-column grid on desktop: left = headline + CTA buttons, right = phone mockup with a WhatsApp chat UI inside. On mobile it stacks vertically with phone centered.

- [ ] **Step 1: Add the hero HTML**

```html
<!-- ═══ HERO ═══ -->
<section class="relative min-h-[calc(100vh-5rem)] flex items-center overflow-hidden" id="hero" aria-labelledby="hero-heading">
  <div class="px-margin-mobile md:px-margin-desktop max-w-7xl mx-auto w-full grid md:grid-cols-2 gap-xl items-center py-xl">

    <!-- Left: copy -->
    <div class="flex flex-col gap-lg z-10">
      <div class="inline-flex items-center gap-xs bg-primary-fixed text-on-primary-fixed-variant px-sm py-1 rounded-full w-fit">
        <span class="material-symbols-outlined text-[16px]">verified</span>
        <span class="font-label-sm text-label-sm uppercase tracking-wider">IA con Seguridad Empresarial</span>
      </div>

      <h1 id="hero-heading" class="font-headline-xl text-[2.5rem] md:text-[3.5rem] lg:text-[4rem] leading-[1.1] text-on-background">
        El mejor empleado de tu restaurante —
        <span class="text-primary">nunca duerme, nunca olvida un pedido.</span>
      </h1>

      <p class="font-body-lg text-body-lg text-on-surface-variant max-w-[500px]">
        Gabot automatiza el flujo de pedidos de WhatsApp con IA que entiende lenguaje natural, gestiona tu menú y se sincroniza con tu POS al instante.
      </p>

      <div class="flex flex-col sm:flex-row gap-md">
        <a href="#contact" class="bg-primary text-on-primary font-label-md text-label-md px-xl py-md rounded-xl shadow-md hover:scale-[1.02] active:scale-95 transition-all flex items-center justify-center gap-sm">
          Comenzar Prueba Gratuita
          <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
        </a>
        <a href="#how-it-works" class="border-2 border-primary text-primary font-label-md text-label-md px-xl py-md rounded-xl hover:bg-primary/5 transition-all flex items-center justify-center gap-sm">
          Ver Demo
          <span class="material-symbols-outlined text-[18px]">play_circle</span>
        </a>
      </div>

      <!-- Trust signals -->
      <div class="flex flex-wrap items-center gap-md text-body-sm text-on-surface-variant" aria-label="Indicadores de confianza">
        <span class="flex items-center gap-xs"><span class="material-symbols-outlined text-primary text-[16px]">check_circle</span> Sin tarjeta de crédito</span>
        <span class="flex items-center gap-xs"><span class="material-symbols-outlined text-primary text-[16px]">check_circle</span> Configuración en 15 min</span>
        <span class="flex items-center gap-xs"><span class="material-symbols-outlined text-primary text-[16px]">check_circle</span> Cancela cuando quieras</span>
      </div>
    </div>

    <!-- Right: phone mockup -->
    <div class="relative flex justify-center items-center">
      <div class="relative w-full max-w-[300px] md:max-w-[360px] aspect-[9/19] bg-on-surface rounded-[3rem] p-3 shadow-2xl border-4 border-surface-container-highest mx-auto" role="img" aria-label="Demo de WhatsApp con Gabot tomando un pedido de hamburguesa">
        <div class="w-full h-full bg-white rounded-[2.5rem] overflow-hidden flex flex-col">
          <!-- WhatsApp Header -->
          <div class="bg-[#075e54] px-md py-sm flex items-center gap-sm text-white">
            <div class="w-9 h-9 rounded-full bg-white/20 flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined filled text-[20px]">smart_toy</span>
            </div>
            <div>
              <p class="text-[13px] font-bold leading-none">Asistente Gabot</p>
              <p class="text-[10px] opacity-80 mt-0.5">en línea</p>
            </div>
          </div>
          <!-- Chat -->
          <div class="flex-1 bg-[#e5ddd5] px-sm py-md space-y-sm overflow-hidden" role="log">
            <div class="bg-white px-sm py-xs rounded-lg rounded-tl-none shadow-sm max-w-[82%]">
              <p class="text-[12px] leading-snug">¡Bienvenido a Burger House! 🍔 ¿Qué puedo ofrecerte hoy?</p>
            </div>
            <div class="bg-[#dcf8c6] px-sm py-xs rounded-lg rounded-tr-none shadow-sm max-w-[82%] ml-auto">
              <p class="text-[12px] leading-snug">Quiero una hamburguesa doble con extra de pepinillos y sin cebolla.</p>
            </div>
            <div class="bg-white px-sm py-xs rounded-lg rounded-tl-none shadow-sm max-w-[85%]">
              <p class="text-[12px] leading-snug">¡Listo! 1× Hamburguesa Doble (+Pepini., −Cebolla) — ¿Agregas papas y bebida por $4.99?</p>
            </div>
            <div class="bg-[#dcf8c6] px-sm py-xs rounded-lg rounded-tr-none shadow-sm max-w-[60%] ml-auto">
              <p class="text-[12px] leading-snug">Sí, perfecto. Confirmar.</p>
            </div>
            <div class="bg-white px-sm py-xs rounded-lg rounded-tl-none shadow-sm max-w-[82%]">
              <p class="text-[12px] leading-snug">✅ Pedido confirmado. Total: <strong>$18.99</strong>. Tiempo estimado: 25 min.</p>
            </div>
          </div>
          <!-- Status bar -->
          <div class="w-full px-md py-sm bg-white/90 border-t border-outline-variant/30 flex items-center gap-sm">
            <div class="w-8 h-8 rounded-full bg-primary/10 flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined filled text-primary text-[18px]">smart_toy</span>
            </div>
            <div>
              <div class="text-[11px] font-bold text-on-surface leading-none">Gabot AI</div>
              <div class="text-[10px] text-green-600 mt-0.5">● En línea y listo</div>
            </div>
          </div>
        </div>
      </div>
      <!-- Ambient glow -->
      <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[400px] h-[400px] bg-primary/8 rounded-full blur-3xl -z-10" aria-hidden="true"></div>
    </div>
  </div>
</section>
```

- [ ] **Step 2: Verify in browser:**
  - Desktop: two columns — headline on left, phone mockup on right
  - Mobile: stacks vertically, phone centered below headline
  - Phone mockup shows a WhatsApp chat with blue header and green-tinted user bubbles
  - "Comenzar Prueba Gratuita" is a solid blue button; "Ver Demo" is outlined blue
  - Trust signals row appears below buttons
  - Background glow visible behind phone

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — hero section"
```

---

### Task 4: Stats / Social Proof Bar

**Files:**
- Modify: `gabot-landing-page/index.html` — append inside `<main>`, after hero section

A horizontal bar with 4 metrics: 500+ Pedidos Diarios, 1.2s Respuesta, 98% Precisión, 15k Comensales Felices.

- [ ] **Step 1: Add the stats HTML**

```html
<!-- ═══ STATS BAR ═══ -->
<section class="bg-surface-container py-lg" id="stats" aria-labelledby="stats-heading">
  <h2 id="stats-heading" class="sr-only">Métricas clave de rendimiento</h2>
  <div class="px-margin-mobile md:px-margin-desktop max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-xl">
    <div class="flex flex-col items-center gap-xs text-center">
      <span class="font-headline-lg text-headline-lg text-primary" aria-label="Más de 500 pedidos diarios">500+</span>
      <span class="font-label-md text-label-md text-on-surface-variant uppercase tracking-wider">Pedidos Diarios</span>
    </div>
    <div class="flex flex-col items-center gap-xs text-center">
      <span class="font-headline-lg text-headline-lg text-primary" aria-label="1 punto 2 segundos de tiempo de respuesta">1.2s</span>
      <span class="font-label-md text-label-md text-on-surface-variant uppercase tracking-wider">Tiempo de Respuesta</span>
    </div>
    <div class="flex flex-col items-center gap-xs text-center">
      <span class="font-headline-lg text-headline-lg text-primary" aria-label="98 por ciento de precisión">98%</span>
      <span class="font-label-md text-label-md text-on-surface-variant uppercase tracking-wider">Tasa de Precisión</span>
    </div>
    <div class="flex flex-col items-center gap-xs text-center">
      <span class="font-headline-lg text-headline-lg text-primary" aria-label="15 mil comensales felices">15k</span>
      <span class="font-label-md text-label-md text-on-surface-variant uppercase tracking-wider">Comensales Felices</span>
    </div>
  </div>
</section>
```

Add the sr-only utility style if not already present (add to the `<style>` block in head):
```css
.sr-only {
  position: absolute; width: 1px; height: 1px;
  padding: 0; margin: -1px; overflow: hidden;
  clip: rect(0,0,0,0); white-space: nowrap; border: 0;
}
```

- [ ] **Step 2: Verify in browser:**
  - Light blue background bar below the hero
  - 4 stats evenly spaced in a row (2×2 grid on mobile)
  - Each stat: large blue number + small uppercase label

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — stats bar"
```

---

### Task 5: Features Section

**Files:**
- Modify: `gabot-landing-page/index.html` — append after stats bar

6 feature cards in a 3-column grid (2-col on tablet, 1-col on mobile). Each card has a blue icon, headline, and description. Cards animate in on scroll (bento-card hover effect via CSS already defined).

- [ ] **Step 1: Add features HTML**

```html
<!-- ═══ FEATURES ═══ -->
<section class="py-xl bg-surface-container-lowest" id="features" aria-labelledby="features-heading">
  <div class="px-margin-mobile md:px-margin-desktop max-w-7xl mx-auto">
    <div class="text-center mb-xl">
      <p class="font-label-md text-label-md text-primary uppercase tracking-widest mb-md">Capacidades del Sistema</p>
      <h2 id="features-heading" class="font-headline-lg text-headline-lg text-on-surface mb-md">Ingeniería de Precisión para Hostelería</h2>
      <p class="font-body-md text-body-md text-on-surface-variant max-w-2xl mx-auto">
        Hemos combinado NLP avanzado con lógica especializada en restaurantes para crear el camarero digital más confiable del mercado.
      </p>
    </div>

    <div class="grid md:grid-cols-3 gap-md" role="list">
      <!-- Feature 1 -->
      <div class="bento-card p-lg rounded-2xl bg-white border border-outline-variant/30 flex flex-col gap-md" role="listitem">
        <div class="w-12 h-12 rounded-xl bg-primary/8 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary">shopping_cart_checkout</span>
        </div>
        <h3 class="font-headline-sm text-headline-sm text-on-surface">Toma pedidos automáticamente</h3>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Se integra con tu POS para procesar pedidos directamente desde WhatsApp sin intervención humana.</p>
      </div>

      <!-- Feature 2 -->
      <div class="bento-card p-lg rounded-2xl bg-white border border-outline-variant/30 flex flex-col gap-md" role="listitem">
        <div class="w-12 h-12 rounded-xl bg-primary/8 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary">menu_book</span>
        </div>
        <h3 class="font-headline-sm text-headline-sm text-on-surface">Conoce tu menú a la perfección</h3>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Sube un PDF o enlace, y Gabot entenderá restricciones dietéticas, alérgenos y disponibilidad en tiempo real.</p>
      </div>

      <!-- Feature 3 -->
      <div class="bento-card p-lg rounded-2xl bg-white border border-outline-variant/30 flex flex-col gap-md" role="listitem">
        <div class="w-12 h-12 rounded-xl bg-primary/8 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary">update</span>
        </div>
        <h3 class="font-headline-sm text-headline-sm text-on-surface">Funciona 24/7</h3>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Tu negocio nunca cierra. Acepta pre-pedidos para el desayuno mientras tu equipo aún duerme.</p>
      </div>

      <!-- Feature 4 -->
      <div class="bento-card p-lg rounded-2xl bg-white border border-outline-variant/30 flex flex-col gap-md" role="listitem">
        <div class="w-12 h-12 rounded-xl bg-primary/8 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary">dashboard</span>
        </div>
        <h3 class="font-headline-sm text-headline-sm text-on-surface">Panel de Administración</h3>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Visibilidad completa de cada conversación, métricas de pedidos y comportamiento del cliente desde una consola central.</p>
      </div>

      <!-- Feature 5 -->
      <div class="bento-card p-lg rounded-2xl bg-white border border-outline-variant/30 flex flex-col gap-md" role="listitem">
        <div class="w-12 h-12 rounded-xl bg-primary/8 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary">flash_on</span>
        </div>
        <h3 class="font-headline-sm text-headline-sm text-on-surface">Configuración en 15 Minutos</h3>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Pasa de cero a estar activo en menos de 15 minutos. Sin código ni claves API complejas para la integración básica.</p>
      </div>

      <!-- Feature 6 -->
      <div class="bento-card p-lg rounded-2xl bg-white border border-outline-variant/30 flex flex-col gap-md" role="listitem">
        <div class="w-12 h-12 rounded-xl bg-primary/8 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary">psychology</span>
        </div>
        <h3 class="font-headline-sm text-headline-sm text-on-surface">Habla con Naturalidad</h3>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Modelos de lenguaje personalizados que mantienen la voz de tu marca y manejan errores o jerga con elegancia.</p>
      </div>
    </div>
  </div>
</section>
```

- [ ] **Step 2: Verify in browser:**
  - White background section
  - 3-column grid of white cards on desktop, 1-column on mobile
  - Each card has a light-blue icon container, bold headline, gray description
  - Cards lift on hover (bento-card transition)

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — features section"
```

---

### Task 6: How It Works

**Files:**
- Modify: `gabot-landing-page/index.html` — append after features

3 steps with circular numbered badges. On desktop a dashed circuit line connects steps horizontally. On mobile steps stack vertically (connector hidden via CSS).

- [ ] **Step 1: Add how-it-works HTML**

```html
<!-- ═══ HOW IT WORKS ═══ -->
<section class="py-xl bg-surface" id="how-it-works" aria-labelledby="how-heading">
  <div class="px-margin-mobile md:px-margin-desktop max-w-7xl mx-auto">
    <div class="text-center mb-xl">
      <p class="font-label-md text-label-md text-primary uppercase tracking-widest mb-md">Flujo de Implementación</p>
      <h2 id="how-heading" class="font-headline-lg text-headline-lg text-on-surface">En Vivo en Tres Simples Pasos</h2>
    </div>

    <div class="relative flex flex-col md:flex-row justify-between items-start md:items-center gap-xl md:gap-lg" aria-label="Pasos de configuración">
      <!-- Connector line (desktop only) -->
      <div class="hidden md:block absolute top-10 left-[14%] right-[14%] h-[2px] circuit-line -z-0" aria-hidden="true"></div>

      <!-- Step 1 -->
      <div class="relative z-10 flex flex-col items-center text-center max-w-[260px] mx-auto md:mx-0">
        <div class="step-connector relative w-20 h-20 rounded-full bg-white border-4 border-primary flex items-center justify-center mb-md shadow-md">
          <span class="material-symbols-outlined text-primary text-4xl">how_to_reg</span>
        </div>
        <h3 class="font-headline-sm text-headline-sm mb-base">Regístrate</h3>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Crea tu cuenta y verifica el perfil comercial de tu restaurante. Tarda menos de 5 minutos.</p>
      </div>

      <!-- Step 2 -->
      <div class="relative z-10 flex flex-col items-center text-center max-w-[260px] mx-auto md:mx-0">
        <div class="step-connector relative w-20 h-20 rounded-full bg-white border-4 border-primary flex items-center justify-center mb-md shadow-md">
          <span class="material-symbols-outlined text-primary text-4xl">upload_file</span>
        </div>
        <h3 class="font-headline-sm text-headline-sm mb-base">Sube Tu Menú</h3>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Sube el PDF de tu menú o vincula tu POS. Gabot aprende tu oferta completa al instante.</p>
      </div>

      <!-- Step 3 -->
      <div class="relative z-10 flex flex-col items-center text-center max-w-[260px] mx-auto md:mx-0">
        <div class="w-20 h-20 rounded-full bg-primary flex items-center justify-center mb-md shadow-md">
          <span class="material-symbols-outlined filled text-on-primary text-4xl">rocket_launch</span>
        </div>
        <h3 class="font-headline-sm text-headline-sm mb-base">¡Activa!</h3>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Conecta tu número de WhatsApp Business y empieza a recibir pedidos automatizados de inmediato.</p>
      </div>
    </div>
  </div>
</section>
```

- [ ] **Step 2: Verify in browser:**
  - Desktop: 3 steps in a row with blue dashed line connecting them
  - Step 3 badge is solid blue (filled) vs outlined for steps 1 & 2
  - Mobile: steps stack vertically, connector line hidden

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — how it works"
```

---

### Task 7: Pricing Section

**Files:**
- Modify: `gabot-landing-page/index.html` — append after how-it-works

3 pricing cards: Starter ($29), Professional ($79, highlighted/scaled), Enterprise (custom). The Pro card has a "Recomendado" badge and is scaled up via `scale-105`.

- [ ] **Step 1: Add pricing HTML**

```html
<!-- ═══ PRICING ═══ -->
<section class="py-xl bg-surface-container-low" id="pricing" aria-labelledby="pricing-heading">
  <div class="px-margin-mobile md:px-margin-desktop max-w-7xl mx-auto">
    <div class="text-center mb-xl">
      <p class="font-label-md text-label-md text-primary uppercase tracking-widest mb-md">Planes de Servicio</p>
      <h2 id="pricing-heading" class="font-headline-lg text-headline-lg text-on-surface mb-md">Precios Simples y Transparentes</h2>
      <p class="font-body-md text-body-md text-on-surface-variant">Sin costos ocultos. Sin contratos. Cancela cuando quieras.</p>
    </div>

    <div class="grid md:grid-cols-3 gap-lg items-end" role="list" aria-label="Planes de precios">

      <!-- Starter -->
      <div class="p-lg rounded-2xl border border-outline-variant bg-white flex flex-col gap-md" role="listitem" aria-label="Plan Starter">
        <div class="font-label-md text-label-md text-on-surface-variant uppercase tracking-widest">Starter</div>
        <div class="flex items-baseline gap-xs">
          <span class="text-4xl font-bold text-on-surface" aria-label="29 dólares por mes">$29</span>
          <span class="text-on-surface-variant font-body-sm">/mes</span>
        </div>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Ideal para food trucks o pequeñas cafeterías que empiezan a crecer.</p>
        <ul class="flex flex-col gap-sm py-md" aria-label="Características incluidas">
          <li class="flex items-center gap-sm font-body-sm text-on-surface-variant">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Hasta 500 pedidos/mes
          </li>
          <li class="flex items-center gap-sm font-body-sm text-on-surface-variant">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> 1 línea de WhatsApp
          </li>
          <li class="flex items-center gap-sm font-body-sm text-on-surface-variant">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Menú de hasta 50 artículos
          </li>
          <li class="flex items-center gap-sm font-body-sm text-on-surface-variant">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Soporte por email
          </li>
        </ul>
        <a href="#contact" class="w-full border-2 border-primary text-primary font-label-md text-label-md py-base rounded-xl hover:bg-primary/5 transition-all text-center" aria-label="Elegir plan Starter">Elegir Starter</a>
      </div>

      <!-- Professional (highlighted) -->
      <div class="p-lg rounded-2xl border-2 border-primary bg-white shadow-xl flex flex-col gap-md relative scale-105" role="listitem" aria-label="Plan Professional, el más popular">
        <div class="absolute -top-4 left-1/2 -translate-x-1/2 bg-primary text-on-primary px-lg py-1 rounded-full font-label-sm text-label-sm uppercase font-bold tracking-wider" aria-label="Plan más popular">Recomendado</div>
        <div class="font-label-md text-label-md text-primary uppercase tracking-widest">Professional</div>
        <div class="flex items-baseline gap-xs">
          <span class="text-5xl font-bold text-on-background" aria-label="79 dólares por mes">$79</span>
          <span class="text-on-surface-variant font-body-sm">/mes</span>
        </div>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Para restaurantes con flujo alto y múltiples sedes.</p>
        <ul class="flex flex-col gap-sm py-md" aria-label="Características incluidas">
          <li class="flex items-center gap-sm font-body-sm text-on-surface font-medium">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Pedidos ilimitados
          </li>
          <li class="flex items-center gap-sm font-body-sm text-on-surface font-medium">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Integración directa con POS
          </li>
          <li class="flex items-center gap-sm font-body-sm text-on-surface font-medium">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Entrenamiento de voz personalizado
          </li>
          <li class="flex items-center gap-sm font-body-sm text-on-surface font-medium">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Soporte prioritario 24/7
          </li>
          <li class="flex items-center gap-sm font-body-sm text-on-surface font-medium">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Analítica avanzada
          </li>
        </ul>
        <a href="#contact" class="w-full bg-primary text-on-primary font-label-md text-label-md py-md rounded-xl shadow-md hover:opacity-90 transition-all text-center" aria-label="Empezar con plan Professional">Empezar con Pro</a>
      </div>

      <!-- Enterprise -->
      <div class="p-lg rounded-2xl border border-outline-variant bg-white flex flex-col gap-md" role="listitem" aria-label="Plan Enterprise">
        <div class="font-label-md text-label-md text-on-surface-variant uppercase tracking-widest">Enterprise</div>
        <div class="text-4xl font-bold text-on-surface" aria-label="Precio personalizado">Personalizado</div>
        <p class="font-body-sm text-body-sm text-on-surface-variant">Para cadenas nacionales, franquicias y grandes grupos de hostelería.</p>
        <ul class="flex flex-col gap-sm py-md" aria-label="Características incluidas">
          <li class="flex items-center gap-sm font-body-sm text-on-surface-variant">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Gerente de cuenta dedicado
          </li>
          <li class="flex items-center gap-sm font-body-sm text-on-surface-variant">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Garantía SLA de tiempo de actividad
          </li>
          <li class="flex items-center gap-sm font-body-sm text-on-surface-variant">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Acceso API para desarrollos propios
          </li>
          <li class="flex items-center gap-sm font-body-sm text-on-surface-variant">
            <span class="material-symbols-outlined text-primary text-[18px]">check_circle</span> Soporte multi-sede
          </li>
        </ul>
        <a href="#contact" class="w-full border-2 border-primary text-primary font-label-md text-label-md py-base rounded-xl hover:bg-primary/5 transition-all text-center" aria-label="Contactar ventas para plan Enterprise">Contactar Ventas</a>
      </div>

    </div>
  </div>
</section>
```

- [ ] **Step 2: Verify in browser:**
  - 3 cards: Starter and Enterprise are white with outlined border; Pro is white with blue border + "Recomendado" badge
  - Pro card is slightly larger (scale-105) and has a shadow
  - Pro card has a solid blue CTA button; others have outlined buttons
  - Light blue section background

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — pricing section"
```

---

### Task 8: Testimonials Section

**Files:**
- Modify: `gabot-landing-page/index.html` — append after pricing

2 testimonial cards in a 2-column grid on desktop, single column on mobile. Large decorative quote marks. Real author names and photos from the Stitch designs.

- [ ] **Step 1: Add testimonials HTML**

```html
<!-- ═══ TESTIMONIALS ═══ -->
<section class="py-xl bg-surface-container-lowest" id="testimonials" aria-labelledby="testimonials-heading">
  <div class="px-margin-mobile md:px-margin-desktop max-w-7xl mx-auto">
    <div class="text-center mb-xl">
      <p class="font-label-md text-label-md text-primary uppercase tracking-widest mb-md">Reseñas de Clientes</p>
      <h2 id="testimonials-heading" class="font-headline-lg text-headline-lg text-on-surface">Con la Confianza de las Mejores Cocinas</h2>
    </div>

    <div class="grid md:grid-cols-2 gap-xl" role="list" aria-label="Testimonios de clientes">

      <!-- Testimonial 1 -->
      <article class="bg-white p-xl rounded-2xl shadow-sm border border-outline-variant/30 relative" role="listitem">
        <span class="material-symbols-outlined filled text-primary-fixed-dim text-6xl absolute top-6 right-6 opacity-20" aria-hidden="true">format_quote</span>
        <div class="flex gap-xs mb-md" aria-label="5 de 5 estrellas">
          <span class="material-symbols-outlined filled text-primary text-[18px]" aria-hidden="true">star</span>
          <span class="material-symbols-outlined filled text-primary text-[18px]" aria-hidden="true">star</span>
          <span class="material-symbols-outlined filled text-primary text-[18px]" aria-hidden="true">star</span>
          <span class="material-symbols-outlined filled text-primary text-[18px]" aria-hidden="true">star</span>
          <span class="material-symbols-outlined filled text-primary text-[18px]" aria-hidden="true">star</span>
        </div>
        <blockquote class="font-body-lg text-body-lg text-on-surface italic mb-lg">
          "Gabot lo cambió todo para nosotros. Solíamos perder un 20% de los pedidos en las horas pico de los viernes porque las líneas estaban ocupadas. Ahora, Gabot maneja 10 chats a la vez y no se le escapa ni un taco."
        </blockquote>
        <footer class="flex items-center gap-md">
          <div class="w-14 h-14 rounded-full bg-surface-dim overflow-hidden flex-shrink-0">
            <img alt="Carlos M., dueño de Tacos El Primo" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAl73VGeubPPUQJWzTBrbOZQPIE9k1GIrUxNZrmcGse_08Cr6DE3AkhzcI7K1OfDHB8A8AgISGmcRkPMqDWjZsugWOpDCEPkak6fRpIp504jWpDgAmiFM7w6Smdnn7_XdLD1ekDyCE28__3hM1mGDv13o0YsctrxMVlsquOUnfAlZYJCgraQmdtqdLsUY2E0vtN9L8rUcHDxVGWRKG-DyTzA_hv5cRXP1rLVwC94HPIvG_IlzKC_qocstBFjTvTalu8jwpk90XEabU" loading="lazy" />
          </div>
          <div>
            <cite class="font-headline-sm text-[18px] not-italic text-on-surface">Carlos M.</cite>
            <p class="text-on-surface-variant text-sm">Dueño, Tacos El Primo</p>
          </div>
        </footer>
      </article>

      <!-- Testimonial 2 -->
      <article class="bg-white p-xl rounded-2xl shadow-sm border border-outline-variant/30 relative" role="listitem">
        <span class="material-symbols-outlined filled text-primary-fixed-dim text-6xl absolute top-6 right-6 opacity-20" aria-hidden="true">format_quote</span>
        <div class="flex gap-xs mb-md" aria-label="5 de 5 estrellas">
          <span class="material-symbols-outlined filled text-primary text-[18px]" aria-hidden="true">star</span>
          <span class="material-symbols-outlined filled text-primary text-[18px]" aria-hidden="true">star</span>
          <span class="material-symbols-outlined filled text-primary text-[18px]" aria-hidden="true">star</span>
          <span class="material-symbols-outlined filled text-primary text-[18px]" aria-hidden="true">star</span>
          <span class="material-symbols-outlined filled text-primary text-[18px]" aria-hidden="true">star</span>
        </div>
        <blockquote class="font-body-lg text-body-lg text-on-surface italic mb-lg">
          "El entrenamiento del menú es increíble. Subí mi carta de café una vez y ya sabía cómo manejar pedidos complejos, sugiriendo productos adicionales a la perfección. Se pagó solo en la primera semana."
        </blockquote>
        <footer class="flex items-center gap-md">
          <div class="w-14 h-14 rounded-full bg-surface-dim overflow-hidden flex-shrink-0">
            <img alt="Daniela R., gerente de Café Verde" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuATdnWWs-0OtETicZJrknXB1DJNqtpbFBvggT01OP1a2J7o6d6rBcLq7wgt2Qcs4kyEtLwZK99Dy6IBeywJhJ5JtN2lte8EGhrNc5A8h4_5EnEPtP_Ckw5NQhK9QmhKWikRoVLS7IXtowoN0QlNGbS0gnUJlI8v8w07Kyu0DVyFyJ02lwUsQM1LxdWyM_jKURfQadg2RcpHpyNJmAsHSBASCPfKoxtF7wDeRPTcRPt1pt2P0wBc1rROShO4qDv-i_yFkqJ1i1ea2Jc" loading="lazy" />
          </div>
          <div>
            <cite class="font-headline-sm text-[18px] not-italic text-on-surface">Daniela R.</cite>
            <p class="text-on-surface-variant text-sm">Gerente, Café Verde</p>
          </div>
        </footer>
      </article>

    </div>
  </div>
</section>
```

- [ ] **Step 2: Verify in browser:**
  - White background section
  - 2 cards side by side on desktop, stacked on mobile
  - Large transparent quote icon in top-right of each card
  - 5 blue stars, italic quote, author name + role at bottom
  - Author photos load (from Google CDN — lazy loaded)

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — testimonials section"
```

---

### Task 9: Contact / CTA Section

**Files:**
- Modify: `gabot-landing-page/index.html` — append after testimonials

Dark section (`bg-inverse-surface`) with 2-column layout on desktop: left = headline + trust bullets, right = white contact form. On mobile it stacks. Form captures: nombre, restaurante, email, mensaje.

- [ ] **Step 1: Add contact HTML**

```html
<!-- ═══ CONTACT / CTA ═══ -->
<section class="py-xl" id="contact" aria-labelledby="contact-heading">
  <div class="px-margin-mobile md:px-margin-desktop max-w-7xl mx-auto bg-inverse-surface rounded-[2rem] p-xl overflow-hidden relative">
    <!-- Ambient glow -->
    <div class="absolute top-0 right-0 w-1/3 h-full bg-primary/10 blur-[100px] -z-0" aria-hidden="true"></div>

    <div class="grid md:grid-cols-2 gap-xl relative z-10 items-center">

      <!-- Left: copy + trust points -->
      <div class="text-inverse-on-surface">
        <p class="font-label-md text-label-md text-primary-fixed-dim uppercase tracking-widest mb-md">Solicita una Demo</p>
        <h2 id="contact-heading" class="font-headline-lg text-headline-lg text-white mb-md">¿Listo para blindar tus operaciones?</h2>
        <p class="font-body-md text-body-md text-white/80 mb-lg max-w-[400px]">
          Solicita una Auditoría del Sistema gratuita. Analizaremos tu flujo actual de pedidos y te mostraremos exactamente cuánto puedes ahorrar con Gabot.
        </p>
        <div class="flex flex-col gap-md">
          <div class="flex items-center gap-md text-white">
            <div class="w-10 h-10 rounded-full bg-white/10 flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-[20px]">security</span>
            </div>
            <span class="font-body-md">Protección de Datos Empresarial</span>
          </div>
          <div class="flex items-center gap-md text-white">
            <div class="w-10 h-10 rounded-full bg-white/10 flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-[20px]">done_all</span>
            </div>
            <span class="font-body-md">Garantía de Tiempo de Actividad del 99.9%</span>
          </div>
          <div class="flex items-center gap-md text-white">
            <div class="w-10 h-10 rounded-full bg-white/10 flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-[20px]">support_agent</span>
            </div>
            <span class="font-body-md">Soporte Técnico en Español 24/7</span>
          </div>
        </div>
      </div>

      <!-- Right: form -->
      <form id="contact-form" class="bg-white p-lg rounded-2xl flex flex-col gap-md" aria-label="Formulario de solicitud de demo" novalidate>
        <h3 class="font-headline-sm text-headline-sm text-on-background">Solicitar una Auditoría del Sistema</h3>

        <div class="grid sm:grid-cols-2 gap-md">
          <div class="flex flex-col gap-xs">
            <label for="contact-name" class="font-label-sm text-label-sm font-bold text-on-surface-variant uppercase">Nombre Completo</label>
            <input id="contact-name" name="name" type="text" required autocomplete="name" aria-required="true"
              class="w-full px-md py-base border border-outline-variant rounded-xl focus:ring-2 focus:ring-primary focus:border-primary transition-all outline-none font-body-sm"
              placeholder="Juan Pérez" />
          </div>
          <div class="flex flex-col gap-xs">
            <label for="contact-restaurant" class="font-label-sm text-label-sm font-bold text-on-surface-variant uppercase">Nombre del Restaurante</label>
            <input id="contact-restaurant" name="restaurant" type="text" required aria-required="true"
              class="w-full px-md py-base border border-outline-variant rounded-xl focus:ring-2 focus:ring-primary focus:border-primary transition-all outline-none font-body-sm"
              placeholder="El Buen Gusto" />
          </div>
        </div>

        <div class="flex flex-col gap-xs">
          <label for="contact-email" class="font-label-sm text-label-sm font-bold text-on-surface-variant uppercase">Correo Electrónico</label>
          <input id="contact-email" name="email" type="email" required autocomplete="email" aria-required="true"
            class="w-full px-md py-base border border-outline-variant rounded-xl focus:ring-2 focus:ring-primary focus:border-primary transition-all outline-none font-body-sm"
            placeholder="juan@restaurante.com" />
        </div>

        <div class="flex flex-col gap-xs">
          <label for="contact-message" class="font-label-sm text-label-sm font-bold text-on-surface-variant uppercase">
            Mensaje <span class="text-outline normal-case font-normal">(opcional)</span>
          </label>
          <textarea id="contact-message" name="message" rows="3"
            class="w-full px-md py-base border border-outline-variant rounded-xl focus:ring-2 focus:ring-primary focus:border-primary transition-all outline-none resize-y font-body-sm"
            placeholder="Cuéntanos sobre tus necesidades..."></textarea>
        </div>

        <button type="submit"
          class="w-full bg-primary text-on-primary font-label-md text-label-md py-md rounded-xl shadow-lg hover:opacity-95 active:scale-[.98] transition-all mt-sm flex items-center justify-center gap-sm">
          <span class="material-symbols-outlined text-[18px]">send</span>
          Enviar Solicitud
        </button>

        <p class="text-[12px] text-outline text-center">
          Al enviar, aceptas nuestra <a href="#" class="text-primary underline">Política de Privacidad</a>. Nunca te enviaremos spam.
        </p>
      </form>

    </div>
  </div>
</section>
```

- [ ] **Step 2: Verify in browser:**
  - Dark navy section (`#213145`) with blue ambient glow top-right
  - Left side: white headline + copy + 3 trust bullet rows
  - Right side: white rounded card containing the form
  - Form has name/restaurant fields side-by-side on desktop, stacked on mobile
  - Blue submit button at bottom

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — contact/CTA section"
```

---

### Task 10: Footer

**Files:**
- Modify: `gabot-landing-page/index.html` — close `</main>` then add footer

Dark footer matching `bg-inverse-surface`, 4-column grid on desktop (brand + 3 link groups). Bottom row: copyright + social links.

- [ ] **Step 1: Close main and add footer HTML**

```html
</main>

<!-- ═══ FOOTER ═══ -->
<footer class="bg-inverse-surface text-surface py-xl px-margin-mobile md:px-margin-desktop" role="contentinfo">
  <div class="max-w-7xl mx-auto grid md:grid-cols-4 gap-xl">

    <!-- Brand -->
    <div class="flex flex-col gap-md">
      <div class="flex items-center gap-2">
        <span class="material-symbols-outlined filled text-primary-fixed-dim text-headline-md">smart_toy</span>
        <span class="font-headline-md text-headline-md font-bold text-white">Gabot</span>
      </div>
      <p class="font-body-sm text-secondary-fixed-dim">
        Empoderando restaurantes a través de la automatización inteligente con IA. Nunca más pierdas un pedido.
      </p>
      <div class="flex gap-md">
        <div class="w-8 h-8 rounded bg-white/10 flex items-center justify-center cursor-pointer hover:bg-primary transition-colors" role="link" tabindex="0" aria-label="Twitter">
          <span class="material-symbols-outlined text-[18px]">share</span>
        </div>
        <div class="w-8 h-8 rounded bg-white/10 flex items-center justify-center cursor-pointer hover:bg-primary transition-colors" role="link" tabindex="0" aria-label="Sitio web">
          <span class="material-symbols-outlined text-[18px]">language</span>
        </div>
      </div>
    </div>

    <!-- Product links -->
    <nav aria-label="Links de producto">
      <h5 class="text-white font-bold font-label-md text-label-md uppercase tracking-wider mb-md">Producto</h5>
      <ul class="flex flex-col gap-sm font-body-sm text-secondary-fixed-dim">
        <li><a class="hover:text-white transition-colors" href="#features">Características</a></li>
        <li><a class="hover:text-white transition-colors" href="#">Integraciones</a></li>
        <li><a class="hover:text-white transition-colors" href="#pricing">Precios</a></li>
        <li><a class="hover:text-white transition-colors" href="#">Docs API</a></li>
      </ul>
    </nav>

    <!-- Company links -->
    <nav aria-label="Links de empresa">
      <h5 class="text-white font-bold font-label-md text-label-md uppercase tracking-wider mb-md">Empresa</h5>
      <ul class="flex flex-col gap-sm font-body-sm text-secondary-fixed-dim">
        <li><a class="hover:text-white transition-colors" href="#">Sobre Nosotros</a></li>
        <li><a class="hover:text-white transition-colors" href="#">Casos de Éxito</a></li>
        <li><a class="hover:text-white transition-colors" href="#">Blog</a></li>
        <li><a class="hover:text-white transition-colors" href="#contact">Contacto</a></li>
      </ul>
    </nav>

    <!-- Legal links -->
    <nav aria-label="Links legales">
      <h5 class="text-white font-bold font-label-md text-label-md uppercase tracking-wider mb-md">Legal</h5>
      <ul class="flex flex-col gap-sm font-body-sm text-secondary-fixed-dim">
        <li><a class="hover:text-white transition-colors" href="#">Política de Privacidad</a></li>
        <li><a class="hover:text-white transition-colors" href="#">Términos de Servicio</a></li>
        <li><a class="hover:text-white transition-colors" href="#">Política de Cookies</a></li>
        <li><a class="hover:text-white transition-colors" href="#">Seguridad de Datos</a></li>
      </ul>
    </nav>

  </div>

  <!-- Bottom bar -->
  <div class="max-w-7xl mx-auto mt-xl pt-lg border-t border-white/10 flex flex-col md:flex-row justify-between items-center gap-md font-body-sm text-secondary-fixed-dim">
    <p>© 2024 Gabot AI Inc. Todos los derechos reservados.</p>
    <div class="flex gap-lg">
      <a class="hover:text-white transition-colors" href="#">Twitter</a>
      <a class="hover:text-white transition-colors" href="#">LinkedIn</a>
      <a class="hover:text-white transition-colors" href="#">Instagram</a>
    </div>
    <div class="flex items-center gap-xs">
      <span class="w-2 h-2 rounded-full bg-green-500 inline-block" aria-hidden="true"></span>
      <span>Sistema Operativo</span>
    </div>
  </div>
</footer>
```

- [ ] **Step 2: Verify in browser:**
  - Dark navy footer matching the contact section color
  - 4 columns on desktop: Gabot brand + 3 link groups
  - Footer link groups collapse to a 2-column grid on mobile
  - Bottom bar: copyright, social links, green status dot
  - All footer links are muted white, turn white on hover

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — footer"
```

---

### Task 11: Mobile Bottom Navigation Bar

**Files:**
- Modify: `gabot-landing-page/index.html` — append after `</footer>` and before `</body>`

Fixed bottom bar visible **only on mobile** (`md:hidden`). 4 tabs: Inicio, Características, Precios, Contacto.

- [ ] **Step 1: Add bottom nav HTML**

```html
<!-- ═══ MOBILE BOTTOM NAV ═══ -->
<nav id="bottom-nav" class="md:hidden fixed bottom-0 left-0 w-full z-50 flex justify-around items-center px-margin-mobile py-sm pb-safe bg-surface border-t border-outline-variant/20 shadow-lg" aria-label="Navegación inferior (móvil)">
  <a id="bottom-nav-home" href="#hero" class="flex flex-col items-center justify-center bg-primary-container text-on-primary-container rounded-full px-md py-1 active:scale-95 transition-transform duration-150" aria-label="Inicio">
    <span class="material-symbols-outlined filled">home</span>
    <span class="font-label-sm text-label-sm">Inicio</span>
  </a>
  <a href="#features" class="flex flex-col items-center justify-center text-on-surface-variant active:scale-95 transition-transform duration-150" aria-label="Características">
    <span class="material-symbols-outlined">grid_view</span>
    <span class="font-label-sm text-label-sm">Funciones</span>
  </a>
  <a href="#pricing" class="flex flex-col items-center justify-center text-on-surface-variant active:scale-95 transition-transform duration-150" aria-label="Precios">
    <span class="material-symbols-outlined">payments</span>
    <span class="font-label-sm text-label-sm">Precios</span>
  </a>
  <a href="#contact" class="flex flex-col items-center justify-center text-on-surface-variant active:scale-95 transition-transform duration-150" aria-label="Contacto">
    <span class="material-symbols-outlined">chat_bubble</span>
    <span class="font-label-sm text-label-sm">Contacto</span>
  </a>
</nav>
```

Also add `pb-20 md:pb-0` to `<main>` so content isn't hidden under the bottom bar on mobile. Update the main tag to:
```html
<main class="pt-16 md:pt-20 pb-20 md:pb-0" id="main-content">
```

- [ ] **Step 2: Verify on mobile viewport (≤ 767px):**
  - Bottom bar appears at the very bottom of the screen
  - 4 icons with labels: Inicio (active/highlighted), Funciones, Precios, Contacto
  - On desktop viewport the bar is completely hidden
  - Main content is not cut off by the bottom bar

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — mobile bottom nav"
```

---

### Task 12: JavaScript (interactions)

**Files:**
- Modify: `gabot-landing-page/index.html` — append `<script>` block before `</body>`

Covers: mobile menu toggle, smooth scroll, contact form handler, active nav highlighting on scroll, bento-card reveal animation.

- [ ] **Step 1: Add the script block**

```html
<script>
  // ── 1. Mobile hamburger menu toggle ──
  const navToggle = document.getElementById('nav-toggle');
  const mobileMenu = document.getElementById('mobile-menu');
  navToggle.addEventListener('click', () => {
    const isOpen = mobileMenu.classList.toggle('hidden');
    navToggle.setAttribute('aria-expanded', (!isOpen).toString());
    // Swap icon
    navToggle.querySelector('.material-symbols-outlined').textContent = isOpen ? 'menu' : 'close';
  });
  // Close mobile menu when a link inside it is clicked
  mobileMenu.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      mobileMenu.classList.add('hidden');
      navToggle.setAttribute('aria-expanded', 'false');
      navToggle.querySelector('.material-symbols-outlined').textContent = 'menu';
    });
  });

  // ── 2. Smooth scroll for all anchor links ──
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      const href = this.getAttribute('href');
      if (href === '#') return;
      const target = document.querySelector(href);
      if (target) {
        e.preventDefault();
        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    });
  });

  // ── 3. Active nav link highlight on scroll (desktop) ──
  const sections = document.querySelectorAll('section[id]');
  const navLinks = document.querySelectorAll('#main-nav .hidden.md\\:flex a[href^="#"]');
  const highlightActiveNav = () => {
    let current = '';
    sections.forEach(section => {
      if (window.scrollY >= section.offsetTop - 120) current = section.id;
    });
    navLinks.forEach(a => {
      const matches = a.getAttribute('href') === '#' + current;
      a.classList.toggle('text-primary', matches);
      a.classList.toggle('font-semibold', matches);
      a.classList.toggle('border-b-2', matches);
      a.classList.toggle('border-primary', matches);
      a.classList.toggle('pb-[2px]', matches);
      a.classList.toggle('text-on-surface-variant', !matches);
    });
  };
  window.addEventListener('scroll', highlightActiveNav, { passive: true });

  // ── 4. Contact form handler (demo) ──
  const contactForm = document.getElementById('contact-form');
  contactForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const btn = contactForm.querySelector('button[type="submit"]');
    const originalHTML = btn.innerHTML;
    btn.innerHTML = '<span class="material-symbols-outlined text-[18px]">check_circle</span> ¡Solicitud Enviada!';
    btn.classList.add('bg-green-600');
    btn.disabled = true;
    setTimeout(() => {
      btn.innerHTML = originalHTML;
      btn.classList.remove('bg-green-600');
      btn.disabled = false;
      contactForm.reset();
    }, 4000);
  });

  // ── 5. Scroll-reveal for bento-cards ──
  const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.remove('opacity-0', 'translate-y-8');
        entry.target.classList.add('opacity-100', 'translate-y-0');
        revealObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1, rootMargin: '0px 0px -40px 0px' });

  document.querySelectorAll('.bento-card').forEach(el => {
    el.classList.add('opacity-0', 'translate-y-8', 'transition-all', 'duration-700');
    revealObserver.observe(el);
  });
</script>
```

Close the `</body></html>` tags after the script.

- [ ] **Step 2: Verify all interactions:**
  - Mobile: hamburger opens/closes menu; icon switches between `menu` and `close`
  - Clicking a nav link closes the mobile menu and scrolls to section
  - Desktop: nav links highlight blue as you scroll through sections
  - Contact form submit shows "¡Solicitud Enviada!" green button for 4s then resets
  - Feature cards fade in from below as they enter the viewport

- [ ] **Step 3: Commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page redesign — JavaScript interactions"
```

---

### Task 13: End-to-End Visual Verification

**Files:**
- Read-only verification

- [ ] **Step 1: Open `index.html` in a browser at desktop width (1280px)**
  - ✅ Background: off-white (#f8f9ff) with subtle dot grid
  - ✅ Nav: white glass bar with Gabot logo (blue), 4 links, CTA button
  - ✅ Hero: 2-column layout, headline, phone mockup on right with WhatsApp chat
  - ✅ Stats: light-blue bar with 500+, 1.2s, 98%, 15k
  - ✅ Features: white background, 3×2 card grid with blue icons
  - ✅ How It Works: 3 steps with circuit connector line
  - ✅ Pricing: 3 cards, Pro highlighted with "Recomendado" badge
  - ✅ Testimonials: 2 white cards with author photos
  - ✅ Contact: dark navy section, left copy + right form
  - ✅ Footer: dark navy, 4 columns, copyright + social links

- [ ] **Step 2: Resize to 375px (mobile)**
  - ✅ Nav hamburger visible, no desktop links
  - ✅ Mobile hamburger opens dropdown menu
  - ✅ Hero stacks: headline on top, phone mockup below
  - ✅ Features: 1-column list of cards
  - ✅ Pricing: 1-column, Pro card returns to normal scale
  - ✅ Bottom nav bar visible with 4 tabs
  - ✅ No content hidden behind bottom nav (main has `pb-20`)

- [ ] **Step 3: Check console for errors**
  Run in browser console:
  ```js
  // Should log 0 errors
  console.log(document.querySelectorAll('[aria-label]').length + ' labeled elements');
  ```
  Expected: no uncaught errors, labeled elements count > 10.

- [ ] **Step 4: Final commit**

```bash
git -C /home/ceul/Documentos/gabot/gabot-landing-page add index.html docs/
git -C /home/ceul/Documentos/gabot/gabot-landing-page commit -m "feat: landing page complete redesign — light mode Stitch design (desktop + mobile)"
```

---

## Self-Review Checklist

- [x] **Spec coverage:** Desktop top nav ✓, Hero phone mockup ✓, Stats bar ✓, Features 3-col ✓, How it works 3 steps ✓, Pricing 3 cards ✓, Testimonials 2-card grid ✓, Dark contact section ✓, Footer ✓, Mobile bottom nav ✓, SEO meta tags kept ✓
- [x] **No placeholders:** All steps contain actual HTML/code
- [x] **Type consistency:** All Tailwind classes use tokens defined in the Tailwind config (Task 1). Font/spacing classes are consistent across all tasks.
- [x] **Gaps:** FAQ section from old page intentionally omitted (not in Stitch designs). If needed, add an accordion FAQ between testimonials and contact, styled with `bg-surface-container-low` and `bg-white` item cards.
