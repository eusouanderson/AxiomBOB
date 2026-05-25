<template>
  <section class="w-full max-w-3xl mx-auto py-16 text-center">
    <h2 class="text-3xl md:text-4xl font-bold mb-4 text-cyan-400">{{ texts.about.title }}</h2>
    <p class="text-lg md:text-xl text-gray-300">{{ texts.about.text }}</p>
  </section>
</template>

<script setup>
import { computed } from 'vue';
import { useLanguageStore } from '@/store/languageStore';
const store = useLanguageStore();
const texts = computed(() => store.texts);
</script>
