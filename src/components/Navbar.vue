<template>
    <div>
        <v-navigation-drawer v-model="drawer" clipped app>
            <v-list dense>
                <v-list-item v-for="link in links" :key="link.text" :to="link.route">
                    <v-list-item-icon>
                        <v-icon>{{ link.icon }}</v-icon>
                    </v-list-item-icon>
                    <v-list-item-content>
                        <v-list-item-title>{{ link.text }}</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
            </v-list>
        </v-navigation-drawer>
        <v-app-bar app clipped-left>
            <v-app-bar-nav-icon class="grey--text" @click="drawer = !drawer"></v-app-bar-nav-icon>
            <v-toolbar-title>
                <span>LdV Todo</span>
            </v-toolbar-title>
            <v-spacer></v-spacer>
            <v-btn text color="grey">
                <span>Sign Out</span>
                <v-icon right>mdi-exit-to-app</v-icon>
            </v-btn>
        </v-app-bar>
    </div>
</template>

<script>


    export default {
        data() {
            return {
                drawer: false,
                links: [
                    { icon: 'mdi-view-dashboard', text: 'Home', route: '/' },
                    { icon: 'mdi-folder', text: 'My Projects', route: '/projects' },
                    { icon: 'mdi-account', text: 'Team', route: '/team' },
                ]

            }
        }
    }
</script>