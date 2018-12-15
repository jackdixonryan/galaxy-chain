<template>
  <v-container fluid>

    <v-dialog
      v-model="dialog"
      width="40%"
      v-if="tutorial"
    >
      <v-card>
        <v-card-title class="headline indigo lighten-2">
          Welcome to the Galaxy, Drifter
        </v-card-title>
        <v-card-text>
          This page is your main console, where you can view basic information about your data in the galaxy. As it's your first time, there's a couple things we're going to need to set up. 
          <div v-if="balance === '0'">
            <v-divider></v-divider>
            The first step of any successful galactic journey is to check one's wallet. Let's do that now.
          </div>
          <div v-else>
            <v-divider></v-divider>
            Looks like you've got a little ether already, stranger. You might just make it out here. 
          </div>
        </v-card-text>
        <v-card-actions>
          <v-btn @click="dialog=false" flat class="indigo">Continue</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <v-dialog
      v-model="getEtherDialog"
      fullscreen
    >
      <v-card>
        <v-card-title class="headline">
          Ether Guide
        </v-card-title>
        <v-card-text>
          <v-container text-xs-center>
            <v-layout row wrap>
              <v-flex xs12>
                <div>
                  <v-btn>What is Ether?</v-btn>
                  <v-btn>The Basics of Transactions</v-btn>
                  <v-btn>Getting Ether</v-btn>
                </div>
              </v-flex>
            </v-layout>
            <v-layout row wrap>
              <v-flex xs6>Getting Ether on the Rinkeby test network is going to be the most difficult step to overcome.</v-flex>
              <v-flex xs6></v-flex>
              <v-flex xs6></v-flex>
              <v-flex xs6></v-flex>
            </v-layout>
          </v-container>
        </v-card-text>
      </v-card>
    </v-dialog>

    <v-layout row wrap>
      <v-flex xs12>
        <v-card>
          <v-card-text v-if="userData">
            <h1>Welcome, {{ userData.name }}
              <router-link 
                to="/ether"
                id="eth-balance"
                class="animated infinite pulse"
              >
                <i class="fab fa-ethereum blue--text"></i>
                <span id="balance" class="blue--text">{{ balance }}
                </span>
              </router-link>
            </h1>
          </v-card-text>
        </v-card>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs12 sm6>
        <v-card>
          <v-card-text>
          
          </v-card-text>
        </v-card>
      </v-flex>
      <v-flex xs12 sm6>
        <v-card>
          <v-card-text>News</v-card-text>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import fb from "../../fb/db";
export default {
  props: ['userhash'],
  data() {
    return {
      userData: null,
      dialog: true,
      getEtherDialog: false,
    }
  },
  computed: {
    tutorial() {
      if (this.userData) return this.userData.newUser;
      else return null;
    },
    balance() {
      return this.$store.state.balance || null;
    }
  },
  mounted() {
    fb.collection("registered")
      .doc(this.userhash)
      .get()
      .then(snapshot => this.userData = snapshot.data())
      .catch(err => console.log());
  }
}
</script>

<style  scoped>
  #eth-balance {
    float: right;
    cursor: pointer;
  }
  #balance {
    padding: 5px;
  }
</style>
