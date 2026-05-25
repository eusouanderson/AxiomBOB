<template>
  <section class="w-full max-w-5xl mx-auto py-16">
    <h2 class="text-3xl md:text-4xl font-bold mb-8 text-cyan-400 text-center">{{ texts.projects.title }}</h2>
    <div class="grid md:grid-cols-2 gap-8">
      <div v-for="project in texts.projects.list" :key="project.title" class="bg-gray-900 rounded-lg shadow p-6 flex flex-col">
        <h3 class="text-xl font-bold text-cyan-300 mb-2">{{ project.title }}</h3>
        <p class="text-gray-300 mb-2">{{ project.description }}</p>
        <ul class="flex flex-wrap gap-2 mb-2">
          <li v-for="tech in project.technologies" :key="tech" class="bg-cyan-800 text-cyan-100 px-2 py-1 rounded text-xs">{{ tech }}</li>
        </ul>
        <div class="flex gap-4 mt-auto">
          <a v-if="project.github" :href="project.github" target="_blank" class="btn-secondary">GitHub</a>
          <a v-if="project.demo" :href="project.demo" target="_blank" class="btn-primary">Demo</a>
        </div>
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
