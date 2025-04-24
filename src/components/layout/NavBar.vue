<template>
  <nav
    class="fixed top-0 left-0 right-0 z-50 bg-black bg-opacity-30 backdrop-blur-md h-16 px-6 flex items-center justify-between">
    <!-- Logo -->
    <div>
      <img src="@/assets/icons/logo.png" alt="Logo" class="h-10 bg-purple-200 p-1 rounded" />
    </div>

    <!-- Links -->
    <div :class="[
      'md:flex md:gap-8 md:static md:bg-transparent md:flex-row',
      menuOpen ? 'flex flex-col absolute top-16 left-0 w-full bg-black bg-opacity-40 p-4 gap-4 shadow-lg rounded-b-md' : 'hidden'
    ]" class="text-white text-lg font-medium font-poppins">
      <a href="#home" class="hover:text-cyan-400">{{ texts.naveBar.home }}</a>
      <a href="#about" class="hover:text-cyan-400">{{ texts.naveBar.services }}</a>
      <a href="#services" class="hover:text-cyan-400">{{ texts.naveBar.aboutUs }}</a>
      <a href="#contact" class="hover:text-cyan-400">{{ texts.naveBar.contactUs }}</a>
      <a href="#portfolio" class="hover:text-cyan-400">{{ texts.naveBar.portfolio }}</a>
    </div>

    <!-- Menu Toggle (Mobile) -->
    <button class="text-white text-3xl md:hidden" @click="menuOpen = !menuOpen">
      ☰
    </button>

  </nav>
</template>

<script setup>
import { useLanguageStore } from '@/store/languageStore';
import { computed, ref } from 'vue';
const menuOpen = ref(false)
const store = useLanguageStore();
const texts = computed(() => store.texts);
</script>
