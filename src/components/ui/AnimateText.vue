<template>
  <div class="container">
    <!-- vídeo no fundo -->
    <video autoplay muted loop playsinline class="bg-video">
      <source src="@/assets/video/video.mp4" type="video/mp4" />
      Seu navegador não suporta vídeos em HTML5.
    </video>

    <!-- sombra preta no vídeo -->
    <div class="overlay"></div>

    <!-- texto com animação -->
    <div class="text-box">
      <h1 class="title-3d" :class="{ 'glow': glowing }">
        {{ typedText }}<span v-if="!finished" class="cursor">|</span>
      </h1>
    </div>
  </div>
</template>


<script setup>
import { onMounted, ref } from 'vue'

const props = defineProps({
  steps: {
    type: Array,
    required: true
  },
  delay: {
    type: Number,
    default: 150
  },
  pause: {
    type: Number,
    default: 600
  }
})

const typedText = ref('')
const finished = ref(false)
const glowing = ref(false)
let currentStep = 0

function typeText(text, delay = props.delay) {
  return new Promise((resolve) => {
    let i = 0
    const interval = setInterval(() => {
      if (i < text.length) {
        typedText.value += text[i]
        i++
      } else {
        clearInterval(interval)
        resolve()
      }
    }, delay)
  })
}

function eraseText(delay = props.delay) {
  return new Promise((resolve) => {
    let i = typedText.value.length
    const interval = setInterval(() => {
      if (i > 0) {
        typedText.value = typedText.value.slice(0, -1)
        i--
      } else {
        clearInterval(interval)
        resolve()
      }
    }, delay)
  })
}

async function runSequence() {
  for (let i = 0; i < props.steps.length; i++) {
    await typeText(props.steps[i])
    if (i < props.steps.length - 1) {
      await new Promise((res) => setTimeout(res, props.pause))
      glowing.value = true
      await new Promise((res) => setTimeout(res, 500))
      glowing.value = false
      await eraseText()
    }
  }
  finished.value = true
}

onMounted(() => {
  runSequence()
})
</script>
<style scoped>
.container {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100%;
  overflow: hidden;
  padding: 0 1rem;
  box-sizing: border-box;
}

.container::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 2;
  pointer-events: none;
  background: radial-gradient(ellipse at center,
      rgba(0, 0, 0, 0) 40%,
      rgba(0, 0, 0, 0.5) 80%,
      rgba(0, 0, 0, 0.9) 100%);
}

.bg-video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  z-index: 0;
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: 1;
}

.text-box {
  position: relative;
  z-index: 2;
  text-align: center;
  white-space: pre-line;
  padding: 0 1rem;
}

.title-3d {
  font-family: 'Orbitron', sans-serif;
  font-size: 4.5rem;
  color: #fff;
  letter-spacing: 20px;
  text-transform: uppercase;
  background: linear-gradient(to right, #90cdea, #ef69a6);
  background-size: 100%;
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  text-shadow:
    0 1px 1px rgba(255, 255, 255, 0.1),
    0 2px 2px rgba(0, 0, 0, 0.2),
    0 4px 4px rgba(0, 0, 0, 0.3),
    0 6px 6px rgba(0, 0, 0, 0.4);
}

/* Cursor responsivo */
.cursor {
  color: #fbf7f7;
  font-size: 4.5rem;
  font-family: 'Orbitron', sans-serif;
  display: inline-block;
  animation: blink 1s step-start infinite;
}

@keyframes blink {
  50% {
    opacity: 0;
  }
}

.glow {
  animation: glowingEffect 1.5s ease-in-out infinite;
}

@keyframes glowingEffect {

  0%,
  100% {
    text-shadow:
      0 1px 1px rgba(255, 255, 255, 0.1),
      0 2px 2px rgba(0, 0, 0, 0.2),
      0 4px 4px rgba(0, 0, 0, 0.3),
      0 6px 6px rgba(0, 0, 0, 0.4),
      0 0 10px rgba(255, 255, 255, 0.2),
      0 0 20px rgba(255, 255, 255, 0.3),
      0 0 30px rgba(255, 255, 255, 0.5);
  }

  50% {
    text-shadow:
      0 1px 1px rgba(255, 255, 255, 0.2),
      0 2px 2px rgba(0, 0, 0, 0.3),
      0 4px 4px rgba(0, 0, 0, 0.4),
      0 6px 6px rgba(63, 61, 61, 0.5),
      0 0 20px rgba(255, 255, 255, 0.4),
      0 0 40px rgba(255, 255, 255, 0.5),
      0 0 60px rgba(255, 255, 255, 0.6);
  }
}

/* Responsividade para dispositivos menores */
@media (max-width: 768px) {
  .title-3d {
    font-size: 2.5rem;
  }

  .cursor {
    font-size: 2.5rem;
  }
}

@media (max-width: 480px) {
  .title-3d {
    font-size: 2rem;
  }

  .cursor {
    font-size: 2rem;
  }

  .text-box {
    padding: 0 0.5rem;
  }
}
</style>
