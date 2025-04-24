<template>
  <button class="toggleLanguage" @click="toggleLanguage">
    <img :src="language === 'eng' ? icon_us : icon_br" alt="Idioma" class="icon" />
  </button>
</template>

<script setup>
import icon_br from '@/assets/icons/icon_brasil.png'
import icon_us from '@/assets/icons/icon_usa.png'
import { computed } from 'vue'
import { useLanguageStore } from '../../store/languageStore.js'

const languageStore = useLanguageStore()
const language = computed(() => languageStore.language)

function toggleLanguage() {
  const newLang = language.value === 'eng' ? 'ptbr' : 'eng'
  languageStore.changeLanguage(newLang)
}
</script>

<style scoped>
.toggleLanguage {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background-color: transparent;
  border: none;
  cursor: pointer;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  z-index: 1000;
  display: flex;
  justify-content: center;
  align-items: center;
}

.toggleLanguage .icon {
  width: 30px;
  height: 30px;

}
</style>
