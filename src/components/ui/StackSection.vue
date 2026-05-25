<template>
  <section class="w-full max-w-5xl mx-auto py-16">
    <h2 class="text-3xl md:text-4xl font-bold mb-8 text-cyan-400 text-center">{{ texts.stack.title }}</h2>
    <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
      <div v-for="item in texts.stack.technologies" :key="item.name" class="flex flex-col items-center">
        <img :src="item.icon" :alt="item.name" class="h-12 mb-2" />
        <span class="font-medium text-gray-200">{{ item.name }}</span>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed } from 'vue';
import { useLanguageStore } from '@/store/languageStore';
const store = useLanguageStore();
const texts = computed(() => store.texts);
</script>
