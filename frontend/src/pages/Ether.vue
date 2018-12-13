<template>
  <v-container fluid text-center class="black">
    <v-layout row wrap>
      <v-flex xs12 style="margin-top:18em;">
        <h1 class="display-3 animated fadeIn white--text">A Guide to Ether</h1>
        <p class="subheading grey--text animated fadeIn delay-1s">
          It's a big galaxy. Here's what you need to know.
        </p>
      </v-flex>
      <v-flex xs12 sm4>
        <v-btn outline color="indigo lighten-4" class="animated fadeInUp delay-2s" href="#ether-info">What is Ether?</v-btn>
      </v-flex>
      <v-flex xs12 sm4>
        <v-btn outline color="indigo lighten-4" class="animated fadeInUp delay-3s" href="#what-for">When do I use Ether?</v-btn>
      </v-flex>
      <v-flex xs12 sm4>
        <v-btn outline color="indigo lighten-4" class="animated fadeInUp delay-4s" href="#get-ether">Get Ether</v-btn>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs8 offset-xs2>
        <div id="ether-info" style="margin-top:40em;">
        <p class="display-1 white--text">Your Ether Wallet</p>
        </div>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs8 offset-xs2>
        <div id="what-for" style="margin-top:40em;">
          <p class="display-1 white--text">What am I paying for?</p>
        </div>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs8 offset-xs2>
        <div id="get-ether" style="margin-top:40em;">
          <p class="display-1 white--text">How to get Ether</p>
        </div>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
// this page will basically be a primer for ethereum, so spruce it up with cool ux, I guess, so you're not just being a dink.
export default {
  data() {
    return {
      view: null,
      offsetTop: 0
    }
  }
}
</script>

<style scoped> 

  .flex {
    text-align: center;
  }

</style>
