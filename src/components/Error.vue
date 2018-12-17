<template>
  <section id="error-main">
    <h1 class="display-1 blue--text">Something Went Wrong</h1>
    <p>We detected an issue with your connection to web3. This could be for a variety of reasons:</p>
    <p>In the top right corner of your browser window, there is a checker that indicates what your error might be.</p>
    <v-card class="error-info">
      <v-card-title>
        <div class="headline">Your Ethereum wallet is not Logged in.</div>
        Simply sign in to your ethereum wallet service through your favorite browser to gain the full functionality of the Galaxy Chain app.
      </v-card-title>
    </v-card>
    <v-card class="error-info">
      <v-card-title>
        <div class="headline">You do not have an Ethereum wallet browser extension.</div>
        Our developers use Metamask, an extention that can be easily added to the Chrome or Brave web browsers. Add this extension and sign up for an account to start using Galaxy Chain.
      </v-card-title>
    </v-card>
    <v-card class="error-info">
      <v-card-title>
        <div class="headline">
          You are on the wrong network.
        </div>
        Galaxy Chain runs on the Rinkeby test network. Switch to this network to start working with the app.
      </v-card-title>
    </v-card>
    <v-card class="error-info">
      <v-card-title>
        <div class="headline">You're just looking around.</div>
        Maybe you just don't want to use Galaxy Chain and you're just exploring. We love your spirit. If you want to know what we're all about, check out <router-link to="/ether">our section about what ether is and how we use it.</router-link>
      </v-card-title>
    </v-card>
  </section>
</template>

<script>
export default {

}
</script>

<style>

#error-main {
  margin: 1.5em;
  text-align: center;
}

.error-info {
  max-width: 500px;
  margin: 0 auto;
  margin-top: 1.5em;
  text-align: left;
}

</style>
