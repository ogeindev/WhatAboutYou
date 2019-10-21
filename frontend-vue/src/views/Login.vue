<template>
  <div class="Login">
    
    <div class="container-fluid ">
      <div class="d-flex justify-content-center h-100 ">
        <div class="card">
          <div class="card-header">
            <h3>Sign In</h3>
            <div class="d-flex justify-content-end social_icon ">
              <span><i class="fab fa-facebook-square"></i></span>
              <span><i class="fab fa-google-plus-square"></i></span>
              <span><i class="fab fa-twitter-square"></i></span>
            </div>
          </div>
          <div class="card-body">
            <form>
              <div class="input-group form-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" name="username" v-model="username" placeholder="username" autocomplete autofocus>
						
              </div>
              <div class="input-group form-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" name="userpassword" v-model="userpassword" class="form-control" placeholder="password" autocomplete>
              </div>
              <div class="row align-items-center remember">
                <input type="checkbox">Remember Me
              </div>
              <div class="form-group">
                <input type="submit" v-on:click="loginUser" value="Login" class="btn float-right login_btn">
              </div>
            </form>
          </div>
          {{error}}

          <div class="card-footer">
            <div class="d-flex justify-content-center links">

              Do not you have an account yet?
              <router-link to="/register">Sign Up</router-link>
            </div>
            <div class="d-flex justify-content-center">
              <!-- <a href="#">Forgot your password?</a> -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: "Login",
  data(){
    return{
      username: '',
      userpassword: '',
      error:'',
      
    }
  },
  methods: {
    loginUser(e) {
        e.preventDefault();
            
        let user = {
            username: this.username,
            userpassword: this.userpassword
        }
      this.$store
      .dispatch("login", user)
      .then(() => this.$router.push("/profile"))
      .catch(err => console.log(err));
      //  let res =  axios.post('http://localhost:3000/login', user)
      //  .then(
      //   console.log(user)
      //  )
      //  .catch(error => {
      //   if (!error.response) {
      //       // network error
      //       this.errorStatus = 'Error: Network Error';
      //   } else {
      //       this.errorStatus = error.response.data.message;
      //   }
      // })
            
    }
  },
}
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css?family=Numans');

  .container-fluid{
  
  align-content: center;
  background-image: url('../assets/fondoverde.jpg');
  background-size: cover;
  background-repeat: repeat-y;
  height: 100vh;
  }

  .card{
  height: 370px;
  margin-top: auto;
  margin-bottom: auto;
  width: 400px;
  background-color: rgba(0,0,0,0.5) !important;
  }

  .social_icon span{
  font-size: 60px;
  margin-left: 10px;
  color: #FFC312;
  }

  .social_icon span:hover{
  color: white;
  cursor: pointer;
  }

  .card-header h3{
  color: white;
  }

  .social_icon{
  position: absolute;
  right: 20px;
  top: -45px;
  }

  .input-group-prepend span{
  width: 50px;
  background-color:rgb(0, 107, 21);
  color: black;
  border:0 !important;
  }

  input:focus{
  outline: 0 0 0 0  !important;
  box-shadow: 0 0 0 0 !important;

  }

  .remember{
  color: white;
  }

  .remember input
  {
  width: 20px;
  height: 20px;
  margin-left: 15px;
  margin-right: 5px;
  }

  .login_btn{
  color: black;
  background-color: rgb(2, 138, 29);
  width: 100px;
  }

  .login_btn:hover{
  color: black;
  background-color: white;
  }

  .links{
  color: white;
  }

  .links a{
  margin-left: 4px;
  }
  a{
    color: rgb(3, 228, 41);
  }

</style>