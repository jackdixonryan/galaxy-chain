<template>
  <v-layout justify-center>
    <v-flex xs10>
        <v-toolbar class="indigo lighten-5 black--text">
          <v-toolbar-title>We Noticed You're New Here.</v-toolbar-title>
        </v-toolbar>
        <v-card>
          <v-container fluid grid-list-md>
            <v-layout row wrap>
              <v-flex xs12 sm6>

                <v-list two-line>
                  <v-list-tile @click="mountComponent('where')">
                    <v-list-tile-content>
                      <v-list-tile-title>Where Am I?</v-list-tile-title>
                    </v-list-tile-content>
                  </v-list-tile>
                  <v-divider></v-divider>
                  <v-list-tile @click="mountComponent('what')">
                    <v-list-tile-content>
                      <v-list-tile-title>What is Galaxy?</v-list-tile-title>
                    </v-list-tile-content>
                  </v-list-tile>
                  <v-divider></v-divider>
                  <v-list-tile @click="mountComponent('signup')">
                    <v-list-tile-content>
                      <v-list-tile-title>I'm ready to sign up!</v-list-tile-title>
                    </v-list-tile-content>
                  </v-list-tile>
                </v-list>

              </v-flex>

              <v-flex xs12 sm6>

                <v-card v-if="mountedComponent === 'where'" class="white--text indigo lighten-2">
                    <v-card-title primary-title>
                      <div class="headline">Welcome to the Polix.</div>
                      <span>Merchants and thinkers, profiteers and politicians. All are welcome in the Polix. Anyone with a virtual id can buy and sell goods, trade on open markets, submit political proposals, and change their own fates.</span>
                    </v-card-title>
                    <v-card-actions>
                      <v-btn flat class="white--text" @click="mountComponent('signup')">I'm ready.</v-btn>
                      <br>
                      <v-btn flat class="white--text" @click="mountComponent('what')">Wait, what?</v-btn>
                    </v-card-actions>
                </v-card>

                <v-card v-if="mountedComponent === 'what'" class="amber white--text">
                  <v-card-title primary-title>
                    <div class="headline">You, on Ethereum.</div>
                    <span>Galaxy is a game running on the Rinkby test network designed to get people interested in and inspired by Ethereum and blockchain technologies. It replicates a political system where people are in charge of their own data, and it uses metamask to manage smart contracts on the Ethereum network. Unlike other games, Galaxy is not for profit and so it's designed to run on the Rinkeby network, so you don't pay a cent to explore.</span>
                  </v-card-title>
                  <v-card-actions>
                    <v-btn flat class="white--text">More on Ethereum</v-btn>
                    <v-btn flat class="white--text">Sign Up</v-btn>
                  </v-card-actions>
                </v-card>

                <v-card v-if="mountedComponent === 'signup'" class="grey darken-3 white--text">
                  <v-card-title primary-title>
                    <div class="headline">Sign Up</div>
                    <span style="margin:1em;">Psyched? Go give us a name and and your age and you'll get signed up!</span>
                    <v-text-field v-model="user.name" type="text" placeholder="Name" solo></v-text-field>
                    <v-text-field v-model="user.age" type="number" placeholder="Age" solo></v-text-field>
                    <v-text-field v-model="user.email" type="email" placeholder="Email (Optional)" solo></v-text-field>
                    <v-btn flat color="white" @click="onSubmit">Sign Up</v-btn>
                  </v-card-title>
                </v-card>

              </v-flex>
            </v-layout>
          </v-container>
        </v-card>
      </v-flex> 
  </v-layout>
</template>

<script>
import db from "../../fb/db";

export default {
  data() {
    return {
      mountedComponent: 'where',
      user: {
        name: "",
        age: null,
        email: "",
        // we're just going to bungle this in to enable the walkthrough.
        newUser: true
      }
    }
  },
  methods: {
    // allows a user to interact with the submenus and mount different cards.
    mountComponent(val) {
      this.mountedComponent = val;
    },

   // Takes user input, does minor validation, then creates a new user with firebase. 
    onSubmit() {
      const emailValid = this.validateEmail(this.user.email);
      if (emailValid && this.user.name && this.user.age) { 
        db.collection("registered")
          .doc(this.$store.state.user)
          .set(this.user);
       }
    },

    // regex expression to validate email
    validateEmail(email) {
      const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return re.test(String(email).toLowerCase());
    }
  }
}
</script>

<style scoped>
  .layout {
    margin-top: 2em;
  }
</style>
