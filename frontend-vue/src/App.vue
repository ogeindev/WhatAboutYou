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
            <router-link class="nav-item nav-link" to="/articles">Articles</router-link>
            <router-link class="nav-item nav-link queryM" to="/forum">Forum</router-link>

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
#nav {
  position: fixed;
  z-index: 1;
  width: 100%;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
  -webkit-box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
  -moz-box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
  -o-box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
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
  .queryM{
    margin-right: 0.5cm ;
  }
  @media only screen and (max-width: 991px) and (min-width: 5px) {
    .queryM{
      margin-right: 0;
    }
    .buttonclass{
      width: 100%;
    }
  }



</style>
