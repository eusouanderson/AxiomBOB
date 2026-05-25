<template>
  <section class="w-full flex flex-col items-center justify-center py-16">
    <h1 class="text-4xl md:text-6xl font-bold mb-2 font-jetbrains-mono animate-fade-in">
      {{ texts.hero.name }}
    </h1>
    <h2 class="text-xl md:text-2xl font-medium mb-4 text-cyan-400 animate-fade-in-delay">
      {{ texts.hero.role }}
    </h2>
    <p class="text-lg md:text-xl mb-6 text-gray-300 animate-fade-in-delay2">
      {{ texts.hero.tagline }}
    </p>
    <div class="flex gap-4 mt-4">
      <a :href="texts.hero.ctaProjects" class="px-6 py-2 rounded bg-cyan-500 text-white font-bold shadow hover:bg-cyan-600 transition">{{ texts.hero.ctaProjectsLabel }}</a>
      <a :href="texts.hero.ctaContact" class="px-6 py-2 rounded border border-cyan-500 text-cyan-400 font-bold hover:bg-cyan-900 transition">{{ texts.hero.ctaContactLabel }}</a>
      <a :href="texts.hero.ctaGithub" class="px-6 py-2 rounded border border-cyan-500 text-cyan-400 font-bold hover:bg-cyan-900 transition" target="_blank">GitHub</a>
    </div>
  </section>
</template>

<script setup>
import { computed } from 'vue';
import { useLanguageStore } from '@/store/languageStore';
const store = useLanguageStore();
const texts = computed(() => store.texts);
</script>

<style scoped>
.animate-fade-in {
  animation: fadeIn 0.7s ease;
}
.animate-fade-in-delay {
  animation: fadeIn 1.2s 0.2s backwards;
}
.animate-fade-in-delay2 {
  animation: fadeIn 1.5s 0.4s backwards;
}


@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>
