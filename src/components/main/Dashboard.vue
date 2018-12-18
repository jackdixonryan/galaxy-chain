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
            <br>
            The first step of any successful galactic journey is to check one's wallet. We noticed you haven't got any currency! Click on your balance if you need some information on starting out with Ethereum.
          </div>
          <div v-else>
            Looks like you've got a little ether already, stranger. You might just make it out here. 
          </div>
        </v-card-text>
        <v-card-actions>
          <v-btn @click="dialog=false" flat class="white">Continue</v-btn>
        </v-card-actions>
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
    <v-layout row wrap id="dashboard-main">
      <v-flex xs12 sm4>
        <v-card>
          <v-card-title>
            <p v-if="!tutorial">Citizen Of {{citizen.country}} since {{citizen.year}}</p>
            <div v-else>
                <p>Not interested in the tutorial? No problem. Turn it off. You can reenable it from the user settings page any time.</p>
                <v-switch label="tutorial" @click="triggerTips" v-model="tutorial"></v-switch>
                <p>You aren't in a country yet! <router-link to="/register/country">You can sign up for one here.</router-link></p>
                <p>Once you sign up for a country affiliation, you will see a lot of information on this page. Selecting a nation opens the door to markets, trades, voting, and a lot more. Plus, you'll get access to your nation's forum page where you can communicate with your fellow citizens.</p>
              </div>
          </v-card-title>
        </v-card>
      </v-flex>
      <v-flex xs12 sm8 id="news-column">
        <div class="headline blue--text">News Feed</div>
        <v-card class="feed-item">
          <v-card-title>
            <div class="title">Citizens of Mercalla reelect their council</div>
            <div class="subtitle" style="width:100%;">12/17/18</div>
            <v-divider style="width:100%;"></v-divider>
            <div class="main">Here You will see major information regarding news stories from the people in your feed. </div>
          </v-card-title>
        </v-card>
        <v-card class="feed-item">
          <v-card-title>
            <div class="title">Listing Items for Sale</div>
            <div class="subtitle">12/15/18</div>
            <div class="main">I'm looking to sell 20 calcium pills at .0005 eth a piece, tradable with Tajiri merchants for ship pieces.</div>
          </v-card-title>
          <v-card-actions>
            <div>18 Remaining</div>
            <v-btn flat color="indigo">Buy</v-btn>
          </v-card-actions>
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
      citizen: {
        country: 'Ajel',
        year: '10.29.1029'
      }
    }
  },
  methods: {
    triggerTips() {
      if (this.tutorial === true) {
        fb.collection('registered')
          .doc(this.userhash)
          .update({
            newUser: false
          })
          .catch(err => console.log());
      }
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

  #dashboard-main {
    margin-top: 1em;
  }

  #balance {
    padding: 5px;
  }

  #news-column {
    text-align: center;
    padding: 1em;
  }

  .feed-item {
    margin-top: 1em;
    text-align: left;
  }

</style>
