<template>
  <section class="w-full max-w-4xl mx-auto py-16">
    <h2 class="text-3xl md:text-4xl font-bold mb-8 text-cyan-400 text-center">{{ texts.experience.title }}</h2>
    <ol class="relative border-l border-cyan-700">
      <li v-for="item in texts.experience.timeline" :key="item.company" class="mb-10 ml-6">
        <span class="absolute flex items-center justify-center w-6 h-6 bg-cyan-700 rounded-full -left-3 ring-8 ring-black"></span>
        <h3 class="flex items-center mb-1 text-lg font-semibold text-cyan-300">{{ item.role }} <span class="ml-2 text-sm text-gray-400">@ {{ item.company }}</span></h3>
        <time class="block mb-2 text-sm font-normal leading-none text-gray-400">{{ item.period }}</time>
        <p class="mb-2 text-base font-normal text-gray-300">{{ item.description }}</p>
        <ul class="list-disc list-inside text-cyan-200 text-sm">
          <li v-for="resp in item.responsibilities" :key="resp">{{ resp }}</li>
        </ul>
      </li>
    </ol>
  </section>
</template>

<script setup>
import { computed } from 'vue';
import { useLanguageStore } from '@/store/languageStore';
const store = useLanguageStore();
const texts = computed(() => store.texts);
</script>
