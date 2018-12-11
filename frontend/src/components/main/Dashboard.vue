<template>
  <h1>Hi</h1>
</template>

<script>
import fb from "../../fb/db";
export default {
  mounted() {
    fb.collection("registered")
    .get()
    .then(res => console.log(res));
  },
  computed: {
    user() {
      return this.$store.state.user || null;
    }
  }
}
</script>

<style>

</style>
