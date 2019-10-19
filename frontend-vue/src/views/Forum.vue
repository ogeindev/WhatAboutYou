<template>
  <div class="Forum">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-3 bg-warning mt-3 ml-3 mb-3 htools topXSQuery">
          <!-- <h1 class="pt-3"><router-link to="/addForumpost">ADD AN POST!</router-link></h1> -->
          <span v-if="isLoggedIn">
            <h2 class="pt-3">
              <router-link to="/addForumpost">ADD AN POSTFORUM!</router-link>
            </h2>
          </span>
          <span v-else>
            <h2 class="pt-3">
              <router-link to="/register">Sign up</router-link>to add an article: or
              <router-link to="/login">Sign in</router-link>if you are already registered
            </h2>
          </span>
          <hr />
          <br />
          <h1>barra de categorias</h1>
          <hr />
          <br />
          <h1>ayuda</h1>
        </div>

        <div class="col-lg-8 ml-3 mt-3 mb-2 querypostsdiv">
          <div class="mb-3">
            <input
              class="inline-block w-50 float-right mr-2 form-control searchXSQuery"
              v-model="text"
              placeholder="Search"
              aria-label="Search"
            />
            <!-- Pagination -->
            <div class="container d-none d-sm-block">
              <div class="row">
                <div class="btn-group col-md-2 offset-md-5 ml-2 pl-0">
                  <button
                    class="btn btn-sm btn-outline-primary"
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
        <div class="querypostsfor">
          <div
            class="bg-dark text-white MarginAndPadding queryposts"
            v-for="forumpost in searchForum"
            v-bind:key="forumpost.id_forumpost"
          >
            <div>
              <h1 class="bg-success p-1 text-left">{{forumpost.titleforumpost}}</h1>

              <h5>{{forumpost.textforumpost}}</h5>
              <div>
                <p class="small text-left m-0 autorAndDate">Autor: {{forumpost.autorforumpost}}</p>
                <p
                  class="small text-right m-0 autorAndDate"
                >{{forumpost.data_created | moment("calendar") }}</p>
              </div>
            </div>
          </div>

        </div>

          <!-- Pagination -->
          <div class="container">
            <div class="row">
              <div class="btn-group col-md-2 offset-md-5">
                <button
                  class="btn btn-sm btn-outline-primary"
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
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Forum",
  data() {
    return {
      allForumposts: [],
      perPage: 10,
      pages: [],
      page: 1,
      text: ""
    };
  },

  mounted: function() {
    this.getForumposts();
  },
  methods: {
    getForumposts() {
      axios
        .get("http://localhost:3000/getForumposts")
        .then(response => (this.allForumposts = response.data))
        .catch(error => {
          if (!error.response) {
            // network error
            this.errorStatus = "Error: Network Error";
          } else {
            this.errorStatus = error.response.data.message;
          }
        });
    },

    paginate(allForumposts) {
      let page = this.page;
      let perPage = this.perPage;
      let from = page * perPage - perPage;
      let to = page * perPage;
      return allForumposts.slice(from, to);
    },
    setPaginate() {
      let numberOfPages = Math.ceil(this.allForumposts.length / this.perPage);
      for (let i = 1; i <= numberOfPages; i++) {
        this.pages.push(i);
      }
    }
  },
  computed: {
    paginateForumposts() {
      return this.paginate(this.allForumposts);
    },
    isLoggedIn: function() {
      return this.$store.getters.isLoggedIn;
    },
    searchForum: function() {
      // lowercase in both sides are to turn into a case insensitive
      return this.paginateForumposts.filter(forumpost =>
        forumpost.titleforumpost.toLowerCase().includes(this.text.toLowerCase())
      );
    }
  },
  watch: {
    allForumposts() {
      this.setPaginate();
    }
  }
};
</script>

<style scoped>
.container-fluid {
  background-image: url("../assets/verdeforum.jpg");
  background-size: cover;
  background-repeat: repeat-y;
  height: auto;
}
.htools {
  height: auto;
}
.MarginAndPadding {
  padding: 0.5rem;
  margin: 0.5rem;
}
.margin0 {
  margin: 0%;
}
.autorAndDate {
  display: inline-block;
  width: 50%;
}

/* RESPONSIVE MEDIA QUERY */
@media only screen and (max-width: 715px) and (min-width: 5px) {
  .searchXSQuery {
    width: 97% !important;
    margin-bottom: 0.5rem !important;
    margin-top: 0.5rem !important;
  }
  .querypostsdiv{
    margin: 0% !important;
    padding: 0% !important;
  }

}
@media only screen and (max-width: 580px) and (min-width: 5px) {
 .querypostsfor{
   margin-top: 3.2rem !important;
   width: 100vw !important;
   
 }
}
@media only screen and (max-width: 1000px) and (min-width: 5px) {
  .topXSQuery {
    width: 100% !important;
    margin: 0% !important;
  }
}
</style>