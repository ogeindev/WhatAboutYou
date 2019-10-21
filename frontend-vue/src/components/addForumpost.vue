<template>
  <div class="addForumpost">
    <div class="container-fluid">
      <div class="row">
        
        <div class="col-md-8 margtop">
          <div class="card">
            <div class="card-body">
              <form >
                <div class="form-group">
                  <strong>Title:</strong>
                  <input type="text" class="form-control" v-model="titleforumpost" placeholder="Title" autofocus>
                </div>
                <div class="form-group">
                  <strong>Category:</strong>
                 
                  <select class="custom-select" v-model="categoryforumpost">
                    <option disabled value> Select one category</option>
                    <option v-for="category in categories" v-bind:key="category">
                      {{category}}
                    </option>
                  </select>
                
                </div>
                <div class="form-group">
                  <strong>Text:</strong>
                  <textarea v-model="textforumpost" rows="8" class="form-control" placeholder="Text"></textarea>
                </div>
                <div class="form-group">
                  <button  v-on:click="postForumpost" type="submit" class="btn btn-success btn-block">Create</button>
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
      titleforumpost: '',
      textforumpost: '',
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
      categoryforumpost: ''
    }
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
      postForumpost(e){
      e.preventDefault();

      let newForumpost = {
        titleforumpost: this.titleforumpost,
        textforumpost: this.textforumpost,
        autorforumpost: this.user.username,
        categoryforumpost: this.categoryforumpost,
        id_user: this.user.id_user
      }
      axios.post('http://localhost:3000/addForumpost', newForumpost)
     
      .then(this.$router.push('/forum'))
      .catch(error => {
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
  .margtop{
    margin-top:5rem;
    margin-bottom: 5.5rem;
    
  }
  .card-body{
    background-color: #2e882b75;
    height: auto;

    }
  .container-fluid{
    background-color: #000000ad;
    height: auto;   
  }
  .row{
  justify-content: space-around
  }
</style>