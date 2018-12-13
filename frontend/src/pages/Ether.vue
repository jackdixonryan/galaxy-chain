<template>
  <v-container fluid text-center class="black">
    <v-layout row wrap>
      <v-flex xs12 style="margin-top:18em;">
        <h1 class="display-1 white--text"><i class="fab fa-ethereum"></i></h1>
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
      <v-flex xs10 offset-xs1>
        <v-parallax src="https://i.amz.mshcdn.com/2L_Bw9Vs0Kfh8RK0n4TjTG2I308=/950x534/filters:quality(90)/https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com%2Fuploads%2Fcard%2Fimage%2F845989%2F19fd9916-1a51-44e1-9bfa-8a5956679120.jpg" id="parallax-img" height="400"></v-parallax>
        <div id="ether-info">
          <v-card>
            <v-card-title class="headline indigo white--text">
              What is Ether?
            </v-card-title>
            <v-card-text>
              You probably know ether as a variety of cryptocurrency, but Ethereum is also a distributed system of organizing smart contracts on the web.
            </v-card-text>
          </v-card>
        </div>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs8 offset-xs2>
        <div id="what-for">
          <p class="display-1 white--text">What am I paying for?</p>
        </div>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs8 offset-xs2>
        <div id="get-ether">
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

  #parallax-img {
    border-radius: 50% 50% 0 0; 
    margin: 0 auto;
    margin-top: 300px;
  }

</style>
