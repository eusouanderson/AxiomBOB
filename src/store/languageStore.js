import { defineStore } from "pinia";
import eng from "../text/eng/text.eng.js";
import ptbr from "../text/ptbr/text.ptbr.js";

export const useLanguageStore = defineStore("language", {
  state: () => ({
    language: "ptbr",
    texts: ptbr,
  }),

  actions: {
    changeLanguage(lang) {
      this.language = lang;
      this.texts = lang === "ptbr" ? ptbr : eng;
    },
  },
});
