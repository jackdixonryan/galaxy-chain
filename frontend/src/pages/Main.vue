<template>
  <div>
    <Dashboard v-if="user && registered"/>
    <Register v-else-if="user && !registered"/>
    <Error v-else />
  </div>
</template>

<script>
import Dashboard from "../components/main/Dashboard";
import Error from "../components/main/Error";
import Register from "../components/main/Register";

import fb from "../fb/db";

// this page will either display: a dashboard for existing users, an error message for those w/o metamask or not signed in, wrong network, etc., or a sign-up for metamask enabled but new visitors / unregistered.

export default {
  components: {
    Dashboard, Error, Register
  },
  data() {
    return {
      registered: false
    }
  },
  computed: {
    user() {
      return this.$store.state.user || null;
    },
    // if we get a value from vuex for a user, we're going to check if the user's hash is registered on the site. 
  },
  watch: {
    // refactored this a touch: ids in the ubase are hashes now. so we just have to check if val exists to flip our bool. 
    user: function(val) {
      fb.collection("registered")
        .doc(val)
        .get()
        .then(result => {
          this.registered = result.exists;
        })
        .catch(err => {
          console.log();
        });
    }
  },
  methods: {
    // takes a user hash to retrieve firestore data.
    setUser(userHash) {
      fb.collection("registered")
        .doc(userHash)
        .get()
        .then(res => {
          this.userInformation = res.data();
        })
        .catch(error => {
          console.log({error});
        });
    }
  }
}
</script>

<style>

</style>
