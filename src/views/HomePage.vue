<template>
  <div class="min-h-screen bg-cyan-400 flex flex-col items-center justify-center text-white text-center px-4">
    <section class="w-full mb-8">
      <NavBar />
    </section>
    <section class="flex-grow flex items-center justify-center">
      <AnimateText :steps="texts.steps" />
    </section>
    <LanguageToggle class="fixed bottom-4 right-4" />
  </div>
</template>

<script setup>
import NavBar from '@/components/layout/NavBar.vue';
import AnimateText from '@/components/ui/AnimateText.vue';
import LanguageToggle from '@/components/ui/LanguageToggle.vue';
import { useLanguageStore } from '@/store/languageStore';
import { computed } from 'vue';

const store = useLanguageStore();
const texts = computed(() => store.texts);
</script>
