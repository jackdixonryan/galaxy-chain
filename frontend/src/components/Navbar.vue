<template>
  <div> 
    <v-toolbar>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Title</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="hidden-sm-and-down">  
        <v-btn flat>Link One</v-btn>
        <v-btn flat>Link Two</v-btn>

        <div id="connection-check" v-if="network">
          <div class="text-xs-center" v-if="web3Account && web3Enabled && network === 'rinkeby'">
            <v-chip>
              <v-avatar class="green">R</v-avatar>
              Welcome!
            </v-chip>
          </div>
          <div class="text-xs-center" v-else-if="web3Account && web3Enabled && network !== 'rinkeby'">
            <v-chip>
              <v-avatar class="orange">{{ network[0].toUpperCase() }}</v-avatar>
              Switch Networks
            </v-chip>
          </div>
          <div class="text-xs-center" v-else-if="web3Enabled">
            <v-chip>
              <v-avatar class="yellow">{{ network[0].toUpperCase() }}</v-avatar>
              Log in to Metamask
            </v-chip>
          </div>
          <div class="text-xs-center" v-else>
            <v-chip close>
              <v-avatar class="red">!</v-avatar>
              Metamask Error
            </v-chip>
          </div>
        </div>

      </v-toolbar-items>
    </v-toolbar>

  <v-navigation-drawer
    v-model="drawer"
    absolute
    temporary> 
      <v-list class="pt-0">
        <v-list-tile
          v-for="item in items"
          :key="item.title"
        >
        <v-list-tile-action>
          <v-icon>{{ item.icon }}</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
        </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>

<script>

export default {
  data() {
    return {
      drawer: null,
      items: [
        { title: 'Home', icon: 'dashboard'},
        { title: 'About', icon: 'question_answer'}
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

</style>
