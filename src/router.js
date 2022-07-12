import Router from 'vue-router';
import ProfilePage from './pages/ProfilePage.vue';
import StagingPage from './pages/StagingPage.vue';
import PentestPage from './pages/PentestPage.vue';
import ReleasePage from './pages/ReleasePage.vue';
import ReportPage from './pages/ReportPage.vue';
// import messagesRoutes from '@/modules/messages/router';
// import peopleRoutes from '@/modules/people/router';

const baseRoutes = [
  {
    path: '/profile',
    name: 'profile',
    component: ProfilePage,
  },
  {
    path: '/staging',
    name: 'staging',
    component: StagingPage,
  },
  {
    path: '/pentest',
    name: 'pentest',
    component: PentestPage,
  },
  {
    path: '/release',
    name: 'release',
    component: ReleasePage,
  },
  {
    path: '/report',
    name: 'report',
    component: ReportPage,
  },
  {
    path: '*',
    redirect: {
      name: 'profile',
    },
  },
];

// const routes = baseRoutes.concat(messagesRoutes, peopleRoutes);
const routes = baseRoutes;
export default new Router({
  routes,
});
