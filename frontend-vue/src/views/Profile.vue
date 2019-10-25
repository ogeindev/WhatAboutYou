<template>
  <div class="Profile">
    <div class="container-fluid">
      <div class="row">
        
        <div class="col-lg-12 bg-style m-1 margtop">
          <h1>Hello {{user.username}}!!</h1>
        </div>
      <div v-show="personalData" class="col-lg-6 bg-style m-1 ml-3 p-1 divsquery leftdiv">    
          <h2 class="bg-white">Personal data</h2>
          <div class="t-align-left">
            <h5>Name: {{user.username}}</h5>
            <h5>Age: {{user.userage}}</h5>
            <h5>Email: {{user.useremail}}</h5>
            
          </div >
          <div class="form-group">
            <img class="float-left" src="#" alt="profile image" />
            <button v-on:click="editProfile"  class="btn btn-success float-right ml-2 buttonEdit">Edit</button>
          </div>
      </div>
        <div  v-show="friendsData" class="col-lg-5 bg-style m-1 p-1 divsquery ">
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

        <div v-show="postsData" class="col-lg-6 bg-style m-1 ml-3 p-1 divsquery leftdiv">
          <h2 class="bg-white">Posts</h2>
          <div class="t-align-left">
            <h2 class="bg-white2">My posts</h2>          
            <div class="scrollArticles">

              <div v-for="userForumpost in userForumposts" v-bind:key="userForumpost.id_forumpost" >
                <div>
                  <p> {{userForumpost.titleforumpost}} </p>
                  <button class="btn barticle">edit</button>
                  <button @click="deleteForumpost(userForumpost.id_forumpost)" class="btn barticle">delete</button>
                </div>
              </div>  
            </div>
          </div>
          <div class="t-align-left">
            <h2>My favorite posts</h2>
            <p>sdsdsds</p>
            <p>dsdsdsds</p>
          </div>
        </div>

        <div v-show="articlesData" class="col-lg-5 bg-style m-1 p-1 divsquery">
          <h2 class="bg-white">Articles</h2>
          <div class="col t-align-left">
            <h3 class="bg-white2">My articles</h3>
            <div class="scrollArticles">

              <div v-for="userArticle in userArticles" v-bind:key="userArticle.id_article" >
                <div>
                  <p> {{userArticle.titlearticle}} </p>
                  <button @click="editArticle(userArticle.id_article)" class="btn barticle">edit</button>
                  <button @click="deleteArticle(userArticle.id_article)" class="btn barticle">delete</button>
                </div>
              </div>  
            </div>
          </div>
          <div v-show="articlesFavData" class="col t-align-left">
            <h3>My favorite articles</h3>
            <p>sdsdsds</p>
            <p>dsdsdsds</p>
          </div>
        </div>
        
        <!-- Edit info -->
        <div 
       v-show="profileInf" class="col-lg-5 bg-style m-1 p-1 divsquery  editUser" id="way">
          <h2 class="bg-white">Edit your profile!</h2>
          <div class="col ">

            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
              </div>
              <input type="text" class="form-control" name="usernameedit" v-model="usernameedit" placeholder="insert your new username" autofocus>
            </div>

            

            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
              </div>
              <input type="email" v-model="useremailedit" name="useremailedit" class="form-control" placeholder="insert your new email">
            </div>

            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
              </div>
              <input type="Number" class="form-control" name="userageedit" v-model="userageedit" placeholder="change your age">
            </div>

            <div class="form-group">
              <button  @click="editProfile2"  class="btn btn-success mr-2">Back</button>
              <button @click="editUser" type="submit"  class="btn btn-success">Send</button>
              
            </div>
          </div>
        </div>

        <!-- Edit info -->

      </div>
    </div>
  
    <!-- Edit Article -->
    <div v-show="articleInf" class="col-lg-12 ">

      <div class="card bg-warning margArt">
        <div class="card-body">
          <form >
            <div class="form-group">
              <strong>Title:</strong>
              <input type="text" class="form-control" v-model="article.titlearticle" autofocus>
        
            </div>
              
            <div class="form-group">
              <strong>Category:</strong>                 
              <select class="custom-select" v-model="article.categoryarticle">
                <option disabled value> Select one category</option>
                <option v-for="category in categories" v-bind:key="category">
                  {{category}}
                </option>
              </select>                
            </div>
            <template>
              <div class="form-group">
                <strong>Tags:</strong>
                <vue-tags-input
                  v-model="article.tagsarticle"  
                  :tags="tags"
                  @tags-changed="newTags => tags = newTags"
                />
              </div>
            </template>                
            <div class="form-group">
              <strong>Text:</strong>    
              <textarea v-model="article.textarticle" rows="8" class="form-control" placeholder="Text"></textarea>
            </div>
            <div class="form-group">
              <button  @click="saveArticle" type="submit" class="btn btn-success btn-block">Save</button>
              {{error}}
            </div>            
          </form>
        </div>
      </div>
    </div>
    <!-- Edit Article -->
    <pre>{{user.id_user}}</pre>
    <pre>{{article.tagsarticle}}</pre>
    <pre>{{tags}}</pre>
    <pre>{{article}}</pre>

  </div>
</template>

<script>
import axios from "axios";
import VueTagsInput from '@johmun/vue-tags-input';
export default {
  components: {
    VueTagsInput,
  },
  name: "Profile",
  data() {
    return {
      user: "",
      personalData: true,
      friendsData: true,
      postsData: true,
      articlesData: true,
      articlesFavData: true,
      profileInf: false,
      articleInf: false,
      usernameedit:'',
      userageedit: '',
      useremailedit:'',
      userArticles: [],
      userForumposts:[],
      article:[],

      //articleEdit
    
      error:'',
      categories:[
        'Psychology',
        'Social Life',
        'Physical',
        'Programming',
        'Mistery',
        'Others'
      ],
      tags:[],
      // art: ''
    };
  },
  created() {
    if (localStorage.getItem("token") === null) {
      this.$router.push("/login");
    }    
  },
  mounted: function() {
    this.getUser();
    this.getUserArticles();
    this.getUserForumposts();
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
    },
    editUser(){ 
      let newInfUser = {
        username: this.editName(),
        userage: this.editAge() ,
        useremail: this.editEmail() ,
        id_user: this.user.id_user
      }
      axios.put('http://localhost:3000/editUser', newInfUser )
      .then( 
        console.log(newInfUser)
        )
      .catch(error => {
        if (!error.response) {
            // network error
            this.errorStatus = 'Error: Network Error';
        } else {
            this.errorStatus = error.response.data.message;
        }
      })
      this.profileInf = false
      this.friendsData = true
      this.postsData = true
      this.articlesData =true
      this.$router.go()
    },
     getUserArticles(){ 
       axios.get('http://localhost:3000/getUserArticles')
      .then( 
        (response) => {this.userArticles = response.data.filter((article) => article.id_user == this.user.id_user)})
      .catch(error => {
        if (!error.response) {
            // network error
            this.errorStatus = 'Error: Network Error';
        } else {
            this.errorStatus = error.response.data.message;
        }
      })
    },
  
    getUserForumposts(){ 
       axios.get('http://localhost:3000/getUserForumposts')
      .then( 
        (response) => {this.userForumposts = response.data.filter((forumpost) => forumpost.id_user == this.user.id_user)})
      .catch(error => {
        if (!error.response) {
            // network error
            this.errorStatus = 'Error: Network Error';
        } else {
            this.errorStatus = error.response.data.message;
        }
      })
    },
    editProfile(){
      this.profileInf = true
      this.friendsData = false
      this.postsData = false
      this.articlesData =false
    },
    editProfile2(){
      this.profileInf = false
      this.friendsData = true
      this.postsData = true
      this.articlesData = true
    },
    editName(){
      if(this.usernameedit == ''){ 
        return this.user.username}
      else{
        return this.usernameedit
      }
    },
    editAge(){
      if(this.userageedit == ''){ 
        return  this.user.userage }
      else{
        return this.userageedit
      }
    },
    editEmail(){
      if(this.useremailedit == '' ){ 
        return this.user.useremail}
      else{
        return this.useremailedit
      }
    },
     deleteArticle(art){
      let id = art
      console.log(id)
      axios.delete('http://localhost:3000/deleteArticle/'+ id)
      .then( 
        console.log('borrado')
      )
      .catch(error => {
        if (!error.response) {
            // network error
            this.errorStatus = 'Error: Network Error';
        } else {
            this.errorStatus = error.response.data.message;
        }
      })
      this.$router.go()
    },
     deleteForumpost(post){
      let id = post
      console.log(id)
       axios.delete('http://localhost:3000/deleteForumpost/'+ id)
      .then( 
        this.$router.push("/profile")
      )
      .catch(error => {
        if (!error.response) {
            // network error
            this.errorStatus = 'Error: Network Error';
        } else {
            this.errorStatus = error.response.data.message;
        }
      })
      this.$router.go()
    },
     editArticle(article){
      let id = article
      console.log(id)
      axios.get('http://localhost:3000/article/'+ id)
      .then( 
        (response) => {this.article = response.data[0]}
      )
      .catch(error => {
        if (!error.response) {
            // network error
            this.errorStatus = 'Error: Network Error';
        } else {
            this.errorStatus = error.response.data.message;
        }
      })
      this.personalData = false
      this.postsData = false
      this.friendsData = false
      this.articlesFavData = false
      this.articleInf = true

    },
    saveArticle(e){
      // e.preventDefault();
      // let id = this.article.id_article
      let articleSaved = {
        titlearticle: this.article.titlearticle,
        textarticle: this.article.textarticle,
        autorarticle: this.user.username,
        categoryarticle: this.article.categoryarticle,
        tagsarticle:  this.getTags(), 
        id_user: this.article.id_user,
        id_article: this.article.id_article
      }
      axios.put('http://localhost:3000/saveArticle', articleSaved)
      
      .then(
        //  this.$router.push('/articles')       
          console.log(articleSaved)
      ).catch(error => {
        if (!error.response) {
            // network error
            this.errorStatus = 'Error: Network Error';
        } else {
            this.errorStatus = error.response.data.message;
        }
      })   
    },
    getTags(){
      let maptag = this.tags.map((tag) => {
        return tag.text
      })
      let stringTags = maptag.toString()
      return stringTags + this.article.tagsarticle
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
.margtop{
  margin-top:5rem !important;
}

.buttonEdit{
  position: relative;
  top: 6.5rem;
  left: -0.5rem;
}
.editUser h2{
  margin-bottom: 3rem;
}
.scrollArticles{
 overflow-y: scroll;
 height: 20vh;
}
.scrollArticles p{
 display: block;
 margin-left: 1rem; 
 font-weight: bold;
 font-style: italic;
margin-bottom: 1rem;
}

.bg-style{  
  background-color:#6ebe82;
}
.bg-white2{
  background-color: rgb(0, 138, 96);
  padding: 0.2rem;
  color: rgb(216, 216, 216);
}
.barticle{
  float: right;
  background-color: #08962e;
  color: white;
  margin-left: 0.2rem;
  margin-right: 0.2rem;
  height: 1.5rem;
  padding-top: 0rem;
  position: relative;
  top: -2.5rem;
  
}
.vue-tags-input{
  max-width: 100%;
}
/* .margArt{
  margin-left: 10rem;
 
} */
@media only screen and (max-width: 1000px) and (min-width: 5px) {
  .divsquery {
    margin-left: 0% !important;
    margin-right: 0% !important;
    margin-bottom: 0% !important;
  }
  .editUser{
    margin-left: 0 !important;
  }
  .buttonEdit{
    position: relative;
    top: 0;
  }
}
</style>