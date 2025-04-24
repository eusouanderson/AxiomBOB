<template>
  <div id="app" class="app">
    <NavBar />
    <div class="flex gap-[2%] flex-wrap content-start">
      <div class="w-full h-[5%]">
      </div>
      <div class="w-1/4 h-3/4">
        <section id="sidebarSection" class="fixed top-[100vh] w-full bg-[#1a1a1a] px-8 py-12">

        </section>
      </div>
      <div class="grow h-3/4">
        <section id="animateTextSection" ref="animateSection" :class="animationClass"
          class="sticky top-0 flex items-center justify-center bg-[#0f0f0f] transition-all duration-1000">
          <AnimateText :steps="texts.steps" />
        </section>
      </div>
      <div class="w-full h-[5%]">
        <section id="descriptionSection" class="fixed top-0 w-full bg-[#120e0e] px-8 py-12 z-10">

        </section>
      </div>
    </div>
    <LanguageToggle />
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

<style scoped>
.app {
  background-color: #0f0f0f;
  color: white;
  min-height: 100vh;

}

.animateTextSection {
  width: 200px;
  height: 100px;
  transition: all 1s ease-in-out;
}

.animateTextSection:hover {
  width: 100vw;
  height: 100vh;
  transition: all 1s ease-in-out;
}
</style>
