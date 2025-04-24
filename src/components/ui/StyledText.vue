<template>
  <p :style="textStyles" class="styled-text">
    <slot></slot>
  </p>
</template>

<script>
export default {
  name: 'StyledText',
  props: {
    fontSize: {
      type: String,
      default: '16px',
    },
    fontWeight: {
      type: String,
      default: 'normal',
    },
    color: {
      type: String,
      default: 'white',
    },
    fontFamily: {
      type: String,
      default: 'Arial, sans-serif',
    },
    textAlign: {
      type: String,
      default: 'left',
    },
  },
  computed: {
    textStyles() {
      return {
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        color: this.color,
        fontFamily: this.fontFamily,
        textAlign: this.textAlign,
      };
    },
  },
};
</script>

<style scoped>
.styled-text {
  position: absolute;
  top: 60%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 9999;
  margin: 0;
  padding: 0;

}
</style>
