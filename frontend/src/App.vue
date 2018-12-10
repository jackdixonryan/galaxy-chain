<template>
  <div>
  <Navbar />
  </div>
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

</style>
