<template>
  <v-app>
    <Navbar></Navbar>
    <v-content>
      <router-view class="ma-4"></router-view>
    </v-content>

  </v-app>
</template>

<script>
import Navbar from '@/components/Navbar'
export default {
  name: 'App',
  components: { Navbar },
  data: () => ({
    //
  }),
};
</script>
