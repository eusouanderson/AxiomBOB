<template>
  <div
    class="min-h-screen bg-black flex flex-col items-center justify-center text-white text-center px-4"
  >
    <!-- NavBar -->
    <section class="w-full mb-8">
      <NavBar />
    </section>

    <!-- Texto animado -->
    <section class="flex-grow flex items-center justify-center">
      <AnimateText :steps="texts.steps" />
    </section>

    <!-- Slider -->
    <section class="w-full mb-8">
      <ImageSlider :images="slides" :perPage="4" :loop="slides.length > 1" :autoplay="true" />
    </section>

    <LanguageToggle class="fixed bottom-4 right-4" />
  </div>
</template>

<script setup>
import { computed } from 'vue';
import ImageSlider from '@/components/ui/ImageSlider.vue';
import NavBar from '@/components/layout/NavBar.vue';
import AnimateText from '@/components/ui/AnimateText.vue';
import LanguageToggle from '@/components/ui/LanguageToggle.vue';
import { useLanguageStore } from '@/store/languageStore';

const store = useLanguageStore();
const texts = computed(() => store.texts);

const modules = import.meta.glob('@/assets/images/slide/*.{jpg,}', { eager: true });

const slides = Object.entries(modules).map(([path, module], index) => ({
  src: module.default,
  alt: `Slide ${index + 1}`,
  title: `Slide ${index + 1}`,
  description: `Description for Slide ${index + 1}`,
  link: '#',
}));
</script>

<style scoped>
.splide__slide {
  display: flex;
  justify-content: center;
  align-items: center;
}

.splide__slide img {
  max-width: 100%;
  max-height: 450px;
  border-radius: 0.5rem;
  object-fit: contain;
}
</style>
