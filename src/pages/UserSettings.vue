<template>
  <v-container>
    <h1 class="display-1 blue--text">User Settings</h1>
    <v-card>
      <v-card-title>
        <div class="headline">
          Main Settings
        </div>
      </v-card-title>
      <v-list two-line>
        <v-list-tile>
          <v-list-tile-content>
            <v-list-tile-title>Trigger tutorial</v-list-tile-title>
            <v-list-tile-sub-title>
              <v-switch v-model="tutorial " @click="triggerTutorial" label="Trigger Tutorial"></v-switch>
            </v-list-tile-sub-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-card>
  </v-container>
</template>

<script>
import db from '../fb/db'; 

export default {
  data() {
    return {
      tutorial: null
    }
  },
  computed: {
    userID() {
      return this.$store.state.user || null;   
    },
    newSetting() {
      return !this.tutorial;
    }
  },
  watch: {
    userID: function(val) {
      this.getTutorial();
    }
  },
  methods: {
    triggerTutorial() {
      if (this.userID) {
        db.collection('registered')
          .doc(this.userID)
          .update({
            newUser: this.newSetting
          })
          .catch(err => console.log());
      }
    },
    getTutorial() {
      db.collection('registered')
        .doc(this.userID)
        .get()
        .then(snap => {
          this.tutorial = snap.data().newUser;
        })
        .catch(err => console.log());
    }
  }
}
</script>

<style>

</style>
