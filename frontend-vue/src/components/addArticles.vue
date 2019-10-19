<template>
  <div class="addArticles">
    <div class="container p-4">
      <div class="row">
        
        <div class="col-md-8">
          <div class="card">
            <div class="card-body">
              <form >
                <div class="form-group">
                  <strong>Title:</strong>
                  <input type="text" class="form-control" v-model="titlearticle" placeholder="Title" autofocus>
                </div>
                <div class="form-group">
                  <strong>Category:</strong>
                 
                  <select class="custom-select" v-model="categoryarticle">
                    <option disabled value> Select one category</option>
                    <option v-for="category in categories" v-bind:key="category">
                      {{category}}
                    </option>
                  </select>
                
                </div>
                <div class="form-group">
                  <strong>Text:</strong>
                  
                  <textarea v-model="textarticle" rows="8" class="form-control" placeholder="Text"></textarea>
                </div>
                <div class="form-group">
                  <button  v-on:click="postArticle"  type="submit" class="btn btn-success btn-block">Create</button>
                  {{error}}
                </div>
                
              
              </form>
              
      
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "addArticles",

  data(){
    return{
      titlearticle: '',
      textarticle: '',
      user:'',
      error:'',
      categories:[
        'Psychology',
        'Social Life',
        'Physical',
        'Programming',
        'Mistery',
        'Others'
      ],
      categoryarticle: ''
    }
  },
  created() {
    if (localStorage.getItem("token") === null) {
      this.$router.push("/login");
    }

  },
  mounted:  function() {    
     this.getUser();
  },
 
  methods: {
      postArticle(e){
      e.preventDefault();

      let newArticle = {
        titlearticle: this.titlearticle,
        textarticle: this.textarticle,
        autorarticle: this.user.username,
        categoryarticle: this.categoryarticle,
        id_user: this.user.id_user
         

      }
       axios.post('http://localhost:3000/addArticles', newArticle)
      
       .then(
         this.$router.push('/articles')
         
       ).catch(error => {
        if (!error.response) {
            // network error
            this.errorStatus = 'Error: Network Error';
        } else {
            this.errorStatus = error.response.data.message;
        }
      })    
    },
    getUser() {
         axios.get("http://localhost:3000/user", {
                headers: { token: localStorage.getItem("token") }
            })
            .then(response => {
                this.user = response.data[0]
                console.log(response)
            });
    }
    

    
  },
}
</script>

<style scoped>

</style>