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
      <v-flex xs8 offset-xs2 id="ether-info">
        <v-parallax src="https://i.imgur.com/gQp3VSW.jpg" id="parallax-img" height="400"></v-parallax>
        <h1 
          class="display-1 section-title" 
          :class="{ 'animated fadeIn white--text' : (scroll >= 771) }"
        >What is Ether?</h1>
        <p 
          class="justified" 
          :class="{ 'animated fadeIn white--text delay-1s' : (scroll >= 771) }"
        >
          Ether is a distributed ledger system that creates secure, distributed, immutable smart contracts. For you, this means that all of your transactions are safe and verified by a wide network of machines.</p>
        <v-timeline dense>
          <v-timeline-item color="green">
            <span slot="opposite"></span>
            <v-card class="elevation-2 hidden" 
              :class="{'animated rotateIn visible' : scroll >= 1280 }">
              <v-card-title class="headline centered">Pay</v-card-title>
              <v-card-text class="justified">
                When you place a transaction on the ethereum network, your balance will be evaluated to see if you have sufficient ether to complete the request.
              </v-card-text>
            </v-card>
          </v-timeline-item>
          <v-timeline-item color="green">
            <span class="opposite"></span>
            <v-card class="elevation-2 hidden" :class="{'animated rotateIn visible delay-1s' : scroll >= 1280 }">
              <v-card-title class="headline centered">Pend</v-card-title>
              <v-card-text class="justified">
                You will notice that all of your transactions take a moment to register. The Ethereum network requires validation when writing data.
              </v-card-text>
            </v-card>
          </v-timeline-item>
          <v-timeline-item color="green">
            <span class="opposite"></span>
            <v-card class="elevation-2 hidden" :class="{'animated rotateIn visible delay-2s' : scroll >= 1280 }">
              <v-card-title class="headline centered">Post</v-card-title>
              <v-card-text class="justified">
                You will shortly receive a message telling you that your transaction was successfully posted. The reason for the delay is that your transaction has to be added to the ethereum blockchain, a process called mining. 
              </v-card-text>
            </v-card>
          </v-timeline-item>
        </v-timeline>
        <p class="white--text justified">Whatever transaction you've posted is now in an immutable ledger. Congratulations! If you purchased an asset it is now permanantly proveably yours.</p>
        <p class="white--text justified">This describes the currency system of ethereum as you will come to interact with it--but you will find while playing Galaxy Chain that ethereum is useful as more than a banking system.</p>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs8 offset-xs2 id="what-for">
        <v-parallax src="https://www.universetoday.com/wp-content/uploads/2018/08/cropped-delta_iv_heavy_streak_composite_edits.jpg" id="parallax-img" height="400"></v-parallax>
        <p class="display-1 white--text section-title">What am I paying for?</p>
        <p class="justified white--text">You will notice while experimenting with galaxy that there are transaction amounts for everything, even when you aren't trying to spend money. When working with Ethereum smart contracts, every transfer of data costs a bit of money, something ethereum programmers call 'gas.'</p>
        <p class="justified white--text">Gas is a small amount of ether attached to every transaction you make with the ethereum blockchain. You can think of it as a sort of sales tax. If you try to buy/sell an item, it will have a gas fee attached to it.</p>
        <p class="justified white--text">Where you will find yourself confused is when you are trying to transact without spending any money. Some of the features on Galaxy don't expressly require spending money: Voting, registering in a nation-state, and making proposals all require a small transaction fee for making the transaction.</p>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs8 offset-xs2 id="get-ether">
        <v-parallax src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/EmissionNebula_NGC6357.jpg/440px-EmissionNebula_NGC6357.jpg" id="parallax-img" height="400"></v-parallax>
        <p class="display-1 white--text section-title">How to get Ether</p>
        <p class="justified white--text">Because Galaxy chain is primarily a learning app so people can have fun learning how to interact with the ethereum network, it is designed only to run on a testing platform called the Rinkeby test network. This means that if you choose to play, it's completely free!</p>
        <p class="justified white--text">It's easy to get ether via the test network. Just follow these steps.</p>
        <v-timeline dense>
          <v-timeline-item color="green">
            <v-card class="elevation-2">
              <v-card-title class="headline">
                <a href="https://faucet.rinkeby.io/" target="_blank" class="rky-link">Go to the Rinkeby Ether Faucet</a>
              </v-card-title>
              <v-card-text class="justified">
                The Rinkeby faucet is an excellent service for developers and curious ether beginners to get some ether that they can use on sites like this one, configured to work on the test network.
              </v-card-text>
            </v-card>
          </v-timeline-item>
          <v-timeline-item color="green">
            <v-card class="elevation-2">
              <v-card-title class="headline">
                Choose a Social Media Site
              </v-card-title>
              <v-card-text class="justified">
                There is a list of social networking sites listed on the faucet's website. To get ether on the test network, you will need to prove that you're not a bot or a spammer by posting your public ethereum address to your social media account of choice. 
              </v-card-text>
            </v-card>
          </v-timeline-item>
          <v-timeline-item color="green">
            <v-card class="elevation-2">
              <v-card-title class="headline">Copy/Paste Your Address</v-card-title>
              <v-card-text class="justified">
                Once you're ready to post/tweet, you will need your ethereum public address pasted in the text. In the below example, this address can be copied by clicking the text that says 'Account 1' at the top of the window.
                <img src="../assets/meta.png" alt="metamask-demo" width="100%">
                Paste the copied address into your social media post, publish the post, and copy the url of the individual post. Don't worry about exposing the address--this is your public ethereum address and it's totally safe to share.
              </v-card-text>
            </v-card>
          </v-timeline-item>
          <v-timeline-item color="green">
            <v-card class="elevation-2">
              <v-card-title class="headline">Wait</v-card-title>
              <v-card-text class="justified">
                As stated above, everything ethereum takes a bit of time. It will take a bit of time for ethereum wallet to show your balance as being updated. As soon as it is, however, you're ready to jump in and start playing! 
              </v-card-text>
            </v-card>
          </v-timeline-item>
        </v-timeline>
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
      scroll: 0,
    }
  },
  methods: {
    handleScroll() {
      // max scroll is most important. We don't need to know where we are but how far we've been. This will permit animations to fire once when an event happens without disappearing after it's done. 
      if (window.scrollY >= this.scroll) this.scroll = window.scrollY;
    }
  },
  created() {
    window.addEventListener('scroll', this.handleScroll);
  },
  destroyed() {
    window.removeEventListener('scroll', this.handleScroll);
  }
}
</script>

<style scoped> 

  #ether-info {
    margin-top: 18em;
  }

  .flex {
    text-align: center;
  }

  #parallax-img {
    /* border-radius: 50% 50% 0 0;  */
    margin: 0 auto;
    margin-top: 50px;
  }
  
  .justified {
    text-align: justify;
  }

  .centered {
    text-align: center;
  }

  .section-title {
    padding: 1em;
  }

  .rky-link {
    text-decoration: none;
  }

  .visible {
    visibility: visible !important;
  }

  .hidden {
    visibility: hidden;
  }

</style>
