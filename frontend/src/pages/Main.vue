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
      registered: false,
      userInformation: null,
      userFirebaseAddress: null,
    }
  },
  computed: {
    user() {
      return this.$store.state.user || null;
    },
    // if we get a value from vuex for a user, we're going to check if the user's hash is registered on the site. 
  },
  watch: {
    user: function(val) {
      fb.collection("registered")
        .where("hash", "==", val)
        .get()
        .then(result => {
          if (result.docs.length === 1) {
            this.registered = true;
            this.setUser(result.docs[0].id);
          }
        })
    }
  },
  methods: {
    // takes a user hash to retrieve firestore data.
    setUser(userHash) {
      this.userFirebaseAddress = userHash;
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
