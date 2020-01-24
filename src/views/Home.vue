<template>
    <div class="home">
      <h1 class="subtitle-1">Home</h1>
      <v-container class="my-5">
        <v-card flat v-for="project in projects" :key="project.title">
        <v-row class="pa-3 project" :class="project.status">
          <v-tooltip left>
            <template v-slot:activator="{ on }">
              <v-col cols="12" md="6" v-on="on">
                <div class="caption grey--text">Title</div>
                <div>{{ project.title }}</div>
              </v-col>
            </template>
            <span>{{ project.content }}</span>
          </v-tooltip>


          <v-col cols="6" sm="4" md="2">
            <div class="caption grey--text">Person</div>
            <div>The{{ project.person }}</div>
          </v-col>
          <v-col cols="6" sm="4" md="2">
            <div class="caption grey--text">Due by</div>
            <div>{{ project.due }}</div>
          </v-col>
          <v-col cols="4" sm="4" md="2">
            <div class="right">
              <v-chip class="white--text my-2 caption" :class="project.status" small>{{ project.status }}</v-chip>
            </div>
          </v-col>
        </v-row>
          <v-divider></v-divider>
        </v-card>
     </v-container>
    </div>
</template>

<script>
  export default {
    data() {
      return {
        projects: [
          { title: 'Design a new website', person: 'The Net Ninja', due: '1st Jan 2019', status: 'ongoing', content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt consequuntur eos eligendi illum minima adipisci deleniti, dicta mollitia enim explicabo fugiat quidem ducimus praesentium voluptates porro molestias non sequi animi!'},
          { title: 'Code up the homepage', person: 'Chun Li', due: '10th Jan 2019', status: 'complete', content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt consequuntur eos eligendi illum minima adipisci deleniti, dicta mollitia enim explicabo fugiat quidem ducimus praesentium voluptates porro molestias non sequi animi!'},
          { title: 'Design video thumbnails', person: 'Ryu', due: '20th Dec 2018', status: 'complete', content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt consequuntur eos eligendi illum minima adipisci deleniti, dicta mollitia enim explicabo fugiat quidem ducimus praesentium voluptates porro molestias non sequi animi!'},
          { title: 'Create a community forum', person: 'Gouken', due: '20th Oct 2018', status: 'overdue', content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt consequuntur eos eligendi illum minima adipisci deleniti, dicta mollitia enim explicabo fugiat quidem ducimus praesentium voluptates porro molestias non sequi animi!'},
        ]
      }
    }
  }
</script>

<style>
  .project.complete{
    border-left: 4px solid #3CD1C2;
  }
  .project.ongoing{
    border-left: 4px solid orange
  }
  .project.overdue{
    border-left: 4px solid tomato;
  }
  .v-chip.complete{
    background: #3cd1c2 !important;
  }
  .v-chip.ongoing{
    background: #ffaa2c !important;
  }
  .v-chip.overdue{
    background: #f83e70 !important;
  }
</style>