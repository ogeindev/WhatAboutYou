<template>
  <div id="app">
    
    <div id="nav">
      <nav class="navbar navbar-expand-lg navbar-light bgCss">
        <router-link class="navbar-brand" to="/">WhatAboutYou</router-link>
        <!-- <form class="form-inline">
          <input class="form-control mr-sm-2" type="search" placeholder="Introduce a name..." aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form> -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
            <div class="navbar-nav">
            <router-link class="nav-item nav-link" to="/profile">Profile</router-link>
            <router-link class="nav-item nav-link" to="/users">Users</router-link>
            <router-link class="nav-item nav-link" to="/forum">Forum</router-link>
            <router-link class="nav-item nav-link mr-3" to="/articles">Articles</router-link>

            <span  v-if="isLoggedIn"> <button class="nav-item nav-link border border-secondary buttonclass" @click="logout">Logout </button></span>
            <span  v-else>  <router-link class="nav-item nav-link border border-secondary" to="/login">Login</router-link></span>
            <router-link class="nav-item nav-link border border-secondary" to="/register">Register</router-link>


          </div>
        </div>
      </nav>
      
    </div>
    <router-view/>
  </div>
</template>

<script>
export default {
  computed: {
    isLoggedIn: function() {
      return this.$store.getters.isLoggedIn;
    }
  },
  methods: {
    logout: function() {
      this.$store.dispatch("logout").then(() => {
        this.$router.push("/login");
      });
    }
  }
};
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav a {
  font-weight: bold;
  color: #2e882b;
}

#nav a.router-link-exact-active {
  color: rgb(72, 119, 182);
}

.bgCss {
  background-color: rgb(228, 228, 228);
}
.buttonclass{
  font-weight: bold;
  color: #2e882b;
}




</style>
