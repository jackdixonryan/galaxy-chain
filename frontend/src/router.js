/* eslint-disable */
import Vue from 'vue';
import Router from 'vue-router';

import Main from './pages/Main';

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
    }
  ]
});

export default router;
