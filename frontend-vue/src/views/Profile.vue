<template>
  <div class="Profile">
    <div class="container-fluid">
      <div class="row">
        
        <div class="col-lg-12 bg-success m-1">
          <h1>Hello {{user.username}}!!</h1>
        </div>

        <div class="col-lg-6 bg-warning m-1 ml-3 p-1 divsquery leftdiv">
          <h2 class="bg-white">Personal data</h2>
          <div class="t-align-left">
            <h5>Name: {{user.username}}</h5>
            <h5>Age: {{user.userage}}</h5>
            <h5>Email: {{user.useremail}}</h5>
            <img src="#" alt="profile image" />
          </div>
        </div>
        <div class="col-lg-5 bg-warning m-1 p-1 divsquery ">
          <h2 class="bg-white">Friends</h2>
          <div class="t-align-left">
            <h3>Connected</h3>
            <div>
              <p>sdsds</p>
              <p>dsdsd</p>
            </div>
          </div>
          <div class="t-align-left">
            <h3>Disconnected</h3>
            <p>sdsdsds</p>
            <p>dsdsdsds</p>
          </div>
        </div>

        <div class="col-lg-6 bg-warning m-1 ml-3 p-1 divsquery leftdiv">
          <h2 class="bg-white">Posts</h2>
          <div class="t-align-left">
            <h2>My posts</h2>
            <p>sdsdsds</p>
            <p>dsdsdsds</p>
          </div>
          <div class="t-align-left">
            <h2>My favorite posts</h2>
            <p>sdsdsds</p>
            <p>dsdsdsds</p>
          </div>
        </div>

        <div class="col-lg-5 bg-warning m-1 p-1 divsquery">
          <h2 class="bg-white">Articles</h2>
          <div class="col t-align-left">
            <h3>My articles</h3>
            <p>sdsdsds</p>
            <p>dsdsdsds</p>
          </div>
          <div class="col t-align-left">
            <h3>My facorite articles</h3>
            <p>sdsdsds</p>
            <p>dsdsdsds</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Profile",
  data() {
    return {
      user: ""
    };
  },
  created() {
    if (localStorage.getItem("token") === null) {
      this.$router.push("/login");
    }
  },
  mounted: function() {
    this.getUser();
  },
  methods: {
    getUser() {
      axios
        .get("http://localhost:3000/user", {
          headers: { token: localStorage.getItem("token") }
        })
        .then(response => {
          this.user = response.data[0];
          console.log(response);
        });
    }
  }
};
</script>

<style scoped>
.t-align-left {
  text-align: left;
  padding-left: 1rem;
}
.leftdiv{
  margin-left: 3.5% !important;
}

@media only screen and (max-width: 1000px) and (min-width: 5px) {
  .divsquery {
    margin-left: 0% !important;
    margin-right: 0% !important;
    margin-bottom: 0% !important;
  }
}
</style>