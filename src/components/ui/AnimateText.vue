<template>
  <div
    class="relative flex justify-center items-center min-h-screen w-full bg-black overflow-hidden px-4 sm:px-6 md:px-8">
    <div class="absolute inset-0 z-10 pointer-events-none bg-gradient-radial" />
    <div class="relative z-20 text-center whitespace-pre-line px-4 text-amber-50">
      {{ texts.dinamicMessage }}
      <h1
        class="text-4xl sm:text-4xl md:text-5xl uppercase bg-gradient-to-r from-[#1f8dc0] via-[#56a3c6] to-[#1f8dc0] bg-clip-text text-transparent shadow-xl title-3d"
        :class="{ 'glow': glowing }">
        {{ typedText }}<span v-if="!finished" class="cursor animate-blink">|</span>
      </h1>
    </div>
  </div>
</template>

<script setup>
import { useLanguageStore } from '@/store/languageStore';
import { computed, onMounted, ref } from 'vue';

const store = useLanguageStore();
const texts = computed(() => store.texts);
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
  },
  loop: {
    type: Boolean,
    default: true
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
  do {
    for (let i = 0; i < props.steps.length; i++) {
      await typeText(props.steps[i])
      if (i < props.steps.length - 1 || props.loop) {
        await new Promise((res) => setTimeout(res, props.pause))
        glowing.value = true
        await new Promise((res) => setTimeout(res, 500))
        glowing.value = false
        await eraseText()
      }
    }
    if (!props.loop) {
      finished.value = true
    }
  } while (props.loop)
}

onMounted(() => {
  runSequence()
})
</script>

<style scoped>
@layer utilities {
  .bg-gradient-radial {
    background: radial-gradient(ellipse at center, rgba(0, 0, 0, 0) 40%, rgba(0, 0, 0, 0.5) 80%, rgba(0, 0, 0, 0.9) 100%);
  }

  .title-3d {
    letter-spacing: 20px;
    text-shadow:
      0 1px 1px rgba(255, 255, 255, 0.1),
      0 2px 2px rgba(0, 0, 0, 0.2),
      0 4px 4px rgba(0, 0, 0, 0.3),
      0 6px 6px rgba(0, 0, 0, 0.4);
  }

  .animate-blink {
    animation: blink 1s step-start infinite;
  }

  .cursor {
    font-size: 4.5rem;
    font-family: 'Orbitron', sans-serif;
    display: inline-block;
    background: linear-gradient(to right, #1f8dc0, #56a3c6, #1f8dc0, #56a3c6);
    background-size: 100%;
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
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

  .glow {
    animation: glowingEffect 1.5s ease-in-out infinite;
  }
}

@keyframes blink {
  50% {
    opacity: 0;
  }
}
</style>
