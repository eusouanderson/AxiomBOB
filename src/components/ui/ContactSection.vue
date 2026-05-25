<template>
  <section class="w-full max-w-2xl mx-auto py-16 text-center">
    <h2 class="text-3xl md:text-4xl font-bold mb-8 text-cyan-400">{{ texts.contact.title }}</h2>
    <p class="text-lg text-gray-300 mb-4">{{ texts.contact.text }}</p>
    <div class="flex flex-col md:flex-row gap-4 justify-center items-center mb-6">
      <a :href="texts.contact.linkedin" target="_blank" class="btn-secondary">LinkedIn</a>
      <a :href="texts.contact.github" target="_blank" class="btn-secondary">GitHub</a>
      <a :href="'mailto:' + texts.contact.email" class="btn-primary">E-mail</a>
    </div>
    <p class="text-cyan-400 font-semibold">{{ texts.contact.cta }}</p>
  </section>
</template>

<script setup>
import { computed } from 'vue';
import { useLanguageStore } from '@/store/languageStore';
const store = useLanguageStore();
const texts = computed(() => store.texts);
</script>
