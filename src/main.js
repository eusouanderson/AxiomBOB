import App from "@/views/HomePage.vue";
import "@fortawesome/fontawesome-free/css/all.min.css";
import { createPinia } from "pinia";
import { createApp } from "vue";

const app = createApp(App);
app.use(createPinia());
app.mount("#app");
