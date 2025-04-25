<template>
  <nav
    class="fixed top-0 left-0 right-0 z-50 bg-black bg-opacity-30 backdrop-blur-md h-40 px-6 flex items-center justify-between">
    <div>
      <img src="@/assets/icons/logo.png" alt="Logo" class="h-10 bg-white p-1 rounded" />
    </div>

    <div :class="[
      'md:flex md:gap-8 md:static md:bg-transparent md:flex-row md:items-center md:justify-end',
      menuOpen ? 'flex flex-col absolute top-0 left-0 w-full bg-black pb-10 bg-opacity-0 p-4 gap-4 shadow-lg rounded-b-md' : 'hidden'
    ]" class="text-white text-lg font-medium font-poppins">

      <a href="#home" class="relative group hover:text-cyan-400">
        {{ texts.naveBar.website }}
        <span
          class="absolute bottom-0 left-0 block h-[2px] w-0 bg-cyan-400 group-hover:w-full transition-all duration-300"></span>
        <!-- Texto de Hover -->
        <span
          class="absolute left-0 top-full mt-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300 text-sm text-cyan-400">
          {{ texts.naveBar.hover.website }}
        </span>
      </a>

      <a href="#cases" class="relative group hover:text-cyan-400">
        {{ texts.naveBar.cases }}
        <span
          class="absolute bottom-0 left-0 block h-[2px] w-0 bg-cyan-400 group-hover:w-full transition-all duration-300"></span>
        <!-- Texto de Hover -->
        <span
          class="absolute left-0 top-full mt-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300 text-sm text-cyan-400">
          {{ texts.naveBar.hover.cases }}
        </span>
      </a>

      <a href="#services" class="relative group hover:text-cyan-400">
        {{ texts.naveBar.services }}
        <span
          class="absolute bottom-0 left-0 block h-[2px] w-0 bg-cyan-400 group-hover:w-full transition-all duration-300"></span>
        <!-- Texto de Hover -->
        <span
          class="absolute left-0 top-full mt-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300 text-sm text-cyan-400">
          {{ texts.naveBar.hover.services }}
        </span>
      </a>

      <a href="#about" class="relative group hover:text-cyan-400">
        {{ texts.naveBar.aboutUs }}
        <span
          class="absolute bottom-0 left-0 block h-[2px] w-0 bg-cyan-400 group-hover:w-full transition-all duration-300"></span>
        <!-- Texto de Hover -->
        <span
          class="absolute left-0 top-full mt-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300 text-sm text-cyan-400">
          {{ texts.naveBar.hover.aboutUs }}
        </span>
      </a>

      <a href="#contact" class="relative group hover:text-cyan-400">
        {{ texts.naveBar.contactUs }}
        <span
          class="absolute bottom-0 left-0 block h-[2px] w-0 bg-cyan-400 group-hover:w-full transition-all duration-300"></span>
        <!-- Texto de Hover -->
        <span
          class="absolute left-0 top-full mt-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300 text-sm text-cyan-400">
          {{ texts.naveBar.hover.contactUs }}
        </span>
      </a>

      <a href="#portfolio" class="relative group hover:text-cyan-400">
        {{ texts.naveBar.portfolio }}
        <span
          class="absolute bottom-0 left-0 block h-[2px] w-0 bg-cyan-400 group-hover:w-full transition-all duration-300"></span>
        <!-- Texto de Hover -->
        <span
          class="absolute left-0 top-full mt-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300 text-sm text-cyan-400">
          {{ texts.naveBar.hover.portfolio }}
        </span>
      </a>

    </div>


    <button @click="toggleTheme" class="text-white text-2xl">
      <span v-if="isDarkMode">
        🌙
      </span>
      <span v-else>
        🌞
      </span>
    </button>

    <button class="text-white text-2xl md:hidden" @click="menuOpen = !menuOpen" :class="{ 'menu-open': menuOpen }">
      <span class="hamburger"></span>
    </button>
  </nav>
</template>

<script setup>
import { useLanguageStore } from '@/store/languageStore';
import { computed, onMounted, ref } from 'vue';

const menuOpen = ref(false);
const store = useLanguageStore();
const texts = computed(() => store.texts);

const isDarkMode = ref(false);

const toggleTheme = () => {
  isDarkMode.value = !isDarkMode.value;

  if (isDarkMode.value) {
    document.body.classList.add('dark');
  } else {
    document.body.classList.remove('dark');
  }
};


onMounted(() => {

  if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
    isDarkMode.value = true;
    document.body.classList.add('dark');
  }
});
</script>

<style scoped>
body.dark {
  background-color: #1a1a1a;
  color: white;
}

body.dark .text-white {
  color: white;
}

body.dark .bg-black {
  background-color: #333;
}

body.dark .bg-opacity-30 {
  background-color: rgba(0, 0, 0, 0.8);
}

.hamburger {
  position: relative;
  width: 30px;
  height: 30px;
  display: block;
  width: 30px;
  height: 3px;
  background-color: white;
  transition: transform 0.3s ease, background-color 0.3s ease;
}

.hamburger:before,
.hamburger:after {
  content: '';
  position: absolute;
  width: 30px;
  height: 3px;
  background-color: white;
  transition: transform 0.3s ease;
}

.hamburger:before {
  top: -8px;
}

.hamburger:after {
  top: 8px;
}

.menu-open .hamburger {
  background-color: transparent;
}

.menu-open .hamburger:before {
  transform: rotate(45deg);
  top: 0;
}

.menu-open .hamburger:after {
  transform: rotate(-45deg);
  top: 0;
}
</style>
