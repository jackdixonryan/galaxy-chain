/* eslint-disable */
import Vue from 'vue';
import Router from 'vue-router';

// page imports
import Main from './pages/Main';
import Ether from './pages/Ether';

Vue.use(Router);

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '*',
      redirect: '/'
    },
    {
      path: '/',
      component: Main
    },
    {
      path: '/ether',
      component: Ether
    }
  ]
});

export default router;
