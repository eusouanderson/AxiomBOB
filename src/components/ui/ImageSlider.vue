<template>
  <div class="splide" ref="slider">
    <div class="splide__track">
      <ul class="splide__list">
        <li class="splide__slide" v-for="(image, index) in images" :key="index">
          <div class="water-container">
            <svg width="0" height="0">
              <filter id="wave">
                <feTurbulence
                  id="turbulence"
                  baseFrequency="0.02 0.05"
                  numOctaves="20"
                  result="turb"
                />
                <feDisplacementMap
                  in2="turb"
                  in="SourceGraphic"
                  scale="200"
                  xChannelSelector="R"
                  yChannelSelector="G"
                />
              </filter>
            </svg>
            <img
              :src="image.src"
              :alt="image.alt"
              class="water-slide"
              :ref="
                (el) => {
                  if (index === activeIndex) activeImage = el;
                }
              "
            />
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script setup>
// ImageSlider.vue

import { ref, onMounted, onBeforeUnmount, nextTick } from 'vue';
import Splide from '@splidejs/splide';
import '@splidejs/splide/dist/css/splide.min.css';

const props = defineProps({
  images: { type: Array, required: true, default: () => [] },
  loop: { type: Boolean, default: true },
  autoplay: { type: Boolean, default: true },
});

const slider = ref(null);
const activeIndex = ref(0);
const activeImage = ref(null);
let splideInstance = null;

onMounted(() => {
  splideInstance = new Splide(slider.value, {
    perPage: 1,
    type: props.loop ? 'loop' : 'slide',
    autoplay: props.autoplay,
    interval: 2000,
    pauseOnHover: true,
    arrows: false,
    pagination: false,
    gap: '1rem',
  }).mount();

  splideInstance.on('move', async (newIndex) => {
    activeIndex.value = newIndex;
    await nextTick();
    triggerWaterEffect();
  });

  triggerWaterEffect();
});

const triggerWaterEffect = () => {
  const img = activeImage.value;
  if (!img) return;

  const turbulence = document.getElementById('turbulence');
  img.style.filter = 'url(#wave)';

  // Animação de turbulência "automática"
  let frame = 0;
  const maxFrames = 10;
  const interval = setInterval(() => {
    const freqX = 0.02 + 0.02 * Math.sin(frame / 2);
    const freqY = 0.05 + 0.02 * Math.cos(frame / 2);
    turbulence.setAttribute('baseFrequency', `${freqX} ${freqY}`);
    frame++;
    if (frame > maxFrames) {
      clearInterval(interval);
      img.style.filter = 'none';
    }
  }, 50);
};

onBeforeUnmount(() => {
  if (splideInstance) splideInstance.destroy();
});
</script>

<style scoped>
.water-container {
  position: relative;
  overflow: hidden;
  border-radius: 0.5rem;
  height: 450px;
}

.water-slide {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}
</style>
