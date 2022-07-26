import Home from './routes/home/Index.vue'
import Cms from './routes/cms/Index.vue'
import cmsRoutes from './routes/cms/router'
import Blog from './routes/blog/Index.vue'
import blogRoutes from './routes/blog/router'
import Store from './routes/store/Index.vue'
import storeRoutes from './routes/store/router'
import Administration from './routes/administration/Index.vue'
import administrationRoutes from './routes/administration/router'

let appRoutes = [
  {
    path: 'home',
    name: 'home',
    component: Home,
  },
  {
    path: 'profile',
    name: 'profile',
    component: Profile,
    children: profileRoutes,
    meta: { guard: 'PROFILE' },
  },
  {
    path: 'staging',
    name: 'staging',
    component: Staging,
    children: stagingRoutes,
    meta: { guard: 'STAGING' },
  },
  {
    path: 'pentest',
    name: 'pentest',
    component: Pentest,
    children: pentestRoutes,
    meta: { guard: 'PENTEST' },
  },
  {
    path: 'administration',
    name: 'administration',
    component: Administration,
    children: administrationRoutes,
    meta: { guard: 'ADMIN' },
  },
]

export default appRoutes
