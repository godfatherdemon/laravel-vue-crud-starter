<template>
  <v-app>
    <v-navigation-drawer v-model="drawer" app temporary>
      <v-list>
        <v-list-tile>
          <v-list-tile-content>
            <v-list-tile-title>
              <span>Menu
              </span>
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-divider></v-divider>
        <template v-for="(item, index) in items">
          <v-list-tile :href="item.href" :to="{name: item.href}" >
            <v-list-tile-action>
              <v-icon light v-html="item.icon"></v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title v-html="item.title"></v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </template>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar div class="green" dark app>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>SI Aplikasi</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon @click.native.stop="openGithub()">
        <v-icon>home</v-icon>
      </v-btn>
    </v-toolbar>
    <v-content>
      <v-fade-transition mode="out-in">
        <router-view></router-view>
      </v-fade-transition>
    </v-content>
    <v-footer class="green pa-3" dark app>
      <span>© 2022 - <a href="https://google.com" class="green text--lighten-5">DISKOMINFO</a></span>
    </v-footer>
  </v-app>
</template>

<script type="text/babel">
export default {
  data() {
    return {
      drawer: false,
      items: [{
        href: 'profile',
        router: true,
        title: 'Profile',
        icon: 'home',
      }, {
        href: 'staging',
        router: true,
        title: 'Staging',
        icon: 'extension',
      }, {
        href: 'pentest',
        router: true,
        title: 'Pentest',
        icon: 'domain',
      },
       {
        href: 'release',
        router: true,
        title: 'Release',
        icon: 'domain',
      },
       {
        href: 'report',
        router: true,
        title: 'Report',
        icon: 'domain',
      }],
    };
  },
  methods: {
    openGithub() {
      window.open('https://github.com/syaifulmuflih95/frontend_siaplikasi');
    },
  },
};
</script>

<style lang="stylus">
  @import '../node_modules/vuetify/src/stylus/main';
  @import 'css/main.css';
</style>
