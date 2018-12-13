<template>
  <v-app>
    <Navbar />
    <router-view />
  </v-app>
</template>


<script>
import Navbar from "./components/Navbar"

export default {
  components: { Navbar },
  mounted() {
    // we have our web3 instance!
    this.$store.commit('getWeb3');
  }
}
</script>

<style>
  * {
    font-family: 'Helvetica', sans-serif;
  }

  html {
    scroll-behavior: smooth;
  }
</style>
