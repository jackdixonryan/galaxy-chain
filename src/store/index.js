/* eslint-disable */

import Vue from 'vue';
import Vuex from 'vuex';
import state from './state';
import Web3 from 'web3';

Vue.use(Vuex);

export const store = new Vuex.Store({
  strict: false,
  state,
  mutations: {
    async getWeb3 (state) {
      if (window.web3) {
        state.web3 = new Web3(window.web3.currentProvider);

        const users = await state.web3.eth.getAccounts();
        state.user = users[0];
        
        const network = await state.web3.eth.net.getNetworkType();
        state.network = network;

        const balance = await state.web3.eth.getBalance(state.user);
        state.balance = balance;
      }
    },
  },
  actions: {}
});
