<template>
  <div> 

    <v-dialog v-model="modal" width="50%" v-if="web3Account && network !== 'rinkeby'" attach="#app">
      <v-card>
        <v-card-title class="headline indigo lighten-4" primary-title>Switch Networks</v-card-title>
        <v-card-text>
          You are currently on the {{ network }} ethereum network. To interact with this site, navigate to your ethereum wallet browser extention and connect to the Rinkeby test network. This page will reload automatically. 
        </v-card-text>
      </v-card>
    </v-dialog>

    <v-dialog v-model="modal" width="50%" v-if="web3Enabled && !web3Account">
      <v-card>
        <v-card-title class="headline indigo lighten-3" primary-title>Log In</v-card-title>
        <v-card-text>
          Your user account on this site is only accessible through your ethereum network account. To interact with this site, navigate to your browser's ethereum wallet and log in to or create an account with ethereum. Once you are logged in, make sure to connect to the Rinkeby test network.
        </v-card-text>
      </v-card>
    </v-dialog>

    <v-dialog v-model="modal" width="50%" v-if="!web3Enabled">
      <v-card>
        <v-card-title class="headline indigo lighten-3" primary-title>No Web3 Detected</v-card-title>
        <v-card-text>
          Some browsers do not support Ethereum connections. Please use Chrome, Firefox, or Brave and get an Ethereum wallet extention like Metamask. 
        </v-card-text>
      </v-card>
    </v-dialog>
             
    <v-toolbar class="indigo white--text">
      <v-toolbar-side-icon @click.stop="drawer = !drawer" class="white--text"></v-toolbar-side-icon>
      <v-toolbar-title>Galaxy</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="hidden-sm-and-down">  
        <v-btn flat class="white--text">Link One</v-btn>
        <v-btn flat class="white--text">Link Two</v-btn>

        <div id="connection-check" v-if="network">
          <div class="text-xs-center" v-if="web3Account && web3Enabled && network === 'rinkeby'">
            <v-chip class="indigo lighten-4">
              <v-avatar class="green">R</v-avatar>
              Welcome!
            </v-chip>
          </div>

          <div class="text-xs-center" v-else-if="web3Account && web3Enabled && network !== 'rinkeby'">

            <v-chip class="indigo lighten-4" @click="modal = true" slot="activator">
              <v-avatar class="orange">{{ network[0].toUpperCase() }}</v-avatar>
              Switch Networks
            </v-chip>
          </div>

          <div class="text-xs-center" v-else-if="web3Enabled">
            <v-chip class="indigo lighten-4" @click="modal = true" slot="activator">
              <v-avatar class="yellow">{{ network[0].toUpperCase() }}</v-avatar>
              Log in to Metamask
            </v-chip>
          </div>
        </div>
        <div class="text-xs-center" v-else>
          <v-chip class="indigo lighten-4" @click="modal = true">
            <v-avatar class="red">!</v-avatar>
            Metamask Error
          </v-chip>
        </div>

      </v-toolbar-items>
    </v-toolbar>

  <v-navigation-drawer
    v-model="drawer"
    absolute
    temporary> 
      <v-list class="pt-0">
        <router-link
          v-for="item in items"
          :key="item.title"
          :to="item.href"
        >
          <v-list-tile>
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          </v-list-tile-content>
          </v-list-tile>
        </router-link>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>

<script>

export default {
  data() {
    return {
      modal: false,
      drawer: null,
      items: [
        {
          title: 'Home', 
          icon: 'dashboard', 
          href: '/'
        },
        { 
          title: 'About', 
          icon: 'question_answer',
          href: '/ether'  
        }
      ],
    }
  },
  computed: {
    web3Account() {
      const user = this.$store.state.user;
      if (user) return user;
      else return null;
    },
    web3Enabled() {
      return this.$store.state.web3 !== null;
    }, 
    network() {
      return this.$store.state.network || null;
    }
  }
}
</script>

<style>
  .v-chip {
    margin-top: 1em;
  }
</style>
