<template>
  <section class="w-full max-w-3xl mx-auto py-16 text-center">
    <h2 class="text-3xl md:text-4xl font-bold mb-8 text-cyan-400">{{ texts.certifications.title }}</h2>
    <ul class="flex flex-col gap-4">
      <li v-for="cert in texts.certifications.list" :key="cert.name" class="bg-gray-900 rounded p-4">
        <span class="font-semibold text-cyan-300">{{ cert.name }}</span>
        <span class="block text-gray-400 text-sm">{{ cert.issuer }} — {{ cert.year }}</span>
      </li>
    </ul>
  </section>
</template>

<script setup>
import { computed } from 'vue';
import { useLanguageStore } from '@/store/languageStore';
const store = useLanguageStore();
const texts = computed(() => store.texts);
</script>
