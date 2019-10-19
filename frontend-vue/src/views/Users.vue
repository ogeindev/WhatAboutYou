<template>
  <div class="Users">
   
    <div class="container-fluid containerUser">
    <div class="row">
      <div class="col-lg-10 mt-3 mx-auto ">
        <div class="active-cyan-3 active-cyan-4 mb-4">
         
          <input  class="form-control" v-model="text"  placeholder="Search" aria-label="Search">
        </div>
      </div>
      <!-- Pagination -->
      <div class="container">
        <div class="row w-100">
          <div class="btn-group col-md-2 offset-md-5 ">
            <button
              class="btn btn-sm btn-outline-primary "
              type="button"
              v-if="page != 1"
              @click="page--"
            >Previous</button>
            <button
            @click="page = pageNumber"
              type="button"
              class="btn btn-sm btn-outline-primary"
              v-for="pageNumber in pages.slice(page-1, page+5)"
              :key="pageNumber"
            >{{pageNumber}}</button>
            <button
              class="btn btn-sm btn-outline-primary"
              type="button"
              @click="page++"
              v-if="page < pages.length"
            >Next</button>
          </div>
        </div>
      </div>
      <!-- Pagination -->
      <div class="container-fluid">
        <div class="row">
        <div class="col-lg-4  mt-3" v-for="user in searchUser" v-bind:key="user.id_user">
          <div class="card">
            <div class="card-header">
              <h2>header: aqui va la foto</h2>
            </div>
            <div class="card-body">
              <h4 class="text-left font-weight-bold">Name: {{user.username}}</h4>
              <h4 class="text-left font-weight-bold">Email: {{user.useremail}}</h4>
              <h4 class="text-left font-weight-bold">Age: {{user.userage}}</h4>
            </div>
            <div class="card-footer">
              <h3 class="small float-right">{{user.data_created | moment("calendar") }}</h3>
            </div>
        </div> 
        </div>
        </div>
      </div>
      
      
      <!-- Pagination -->
      <div class="container mt-2 ">
        <div class="row ">
          <div class="btn-group col-md-2 offset-md-5 ">
            <button
              class="btn btn-sm btn-outline-primary "
              type="button"
              v-if="page != 1"
              @click="page--"
            >Previous</button>
            <button
            @click="page = pageNumber"
              type="button"
              class="btn btn-sm btn-outline-primary"
              v-for="pageNumber in pages.slice(page-1, page+5)"
              :key="pageNumber"
            >{{pageNumber}}</button>
            <button
              class="btn btn-sm btn-outline-primary"
              type="button"
              @click="page++"
              v-if="page < pages.length"
            >Next</button>
          </div>
        </div>
      </div>
      <!-- Pagination -->
      </div>
    </div>
  </div>

</template>

<script>
import axios from 'axios'

export default {
  name: "Users",
  data(){
    return{
      allUsers: [],
      perPage: 15,
      pages: [],
      page: 1,
      text: ''
      
    }
  },

  mounted: function() {
    this.getUsers();
  },

  methods: {
      getUsers(){
        axios.get('http://localhost:3000/users')
      .then(response => this.allUsers = response.data)
      .catch(error => {
        if (!error.response) {
            // network error
            this.errorStatus = 'Error: Network Error';
        } else {
            this.errorStatus = error.response.data.message;
        }
      })
    },
    


    // PAGINATION
    paginate(allUsers) {
      let page = this.page;
      let perPage = this.perPage;
      let from = page * perPage - perPage;
      let to = page * perPage;
      return allUsers.slice(from, to);
    },
    setPaginate() {
      let numberOfPages = Math.ceil(this.allUsers.length / this.perPage);
      for (let i = 1; i <= numberOfPages; i++) {
        this.pages.push(i);
      }
    },
  },
  computed: {
    paginateUsers() {
      let paginateUsers =  this.paginate(this.allUsers);
      return paginateUsers
    },
    searchUser: function() {
      // lowercase in both sides are to turn into a case insensitive
      return this.paginateUsers.filter((user) => user.username.toLowerCase().includes(this.text.toLowerCase()))
    }
        
    
  },
  watch: {
      allUsers() {
        this.setPaginate();
    },
  }
}
</script>

<style scoped>
  .containerUser {
    background-image: url("../assets/usersverde.jpg"); 
    background-size: cover;
    background-repeat: repeat-y;
    height: 100%;
    padding-bottom: 2%;

  }
  

</style>