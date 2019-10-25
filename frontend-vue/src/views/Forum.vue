<template>
  <div class="Forum">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-3 m-1 bg-success margtop">
          <!-- <h1 class="pt-3"><router-link to="/addForumpost">ADD AN POST!</router-link></h1> -->
          <span v-if="isLoggedIn">
            <h2 class="pt-3">
              <router-link class="text-dark" to="/addForumpost">ADD AN POST!</router-link>
            </h2>
          </span>
          <span v-else>
            <h2 class="pt-3">
              <router-link to="/register">Sign up</router-link> to add an article: or
              <router-link to="/login">Sign in</router-link> if you are already registered
            </h2>
          </span>
          <hr />
          <br />
          <h3>Categories</h3>
          <br>
          <ul class="categoryfor" v-for="categorylist in categories" v-bind:key="categorylist">
            <li @click="changeCategory(categorylist)">{{categorylist}}</li>
          </ul>
          <hr />
          <br />
          <h1>Tags:</h1>
          <div class="categorytag" v-for="tagart in alltags" v-bind:key="tagart">
            <p v-on:click="changetTag(tagart)">{{tagart}} </p>
          </div>
        </div>

        <div class="col-lg-8 ml-3 mt-3 mb-2 querypostsdiv ">
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
        <div >
          <div
            class="bg-dark text-white MarginAndPadding queryposts "
            v-for="forumpost in paginateForumposts"
            v-bind:key="forumpost.id_forumpost"
          >
            <div>
              <h1 class="bg-success p-1 text-left">{{forumpost.titleforumpost}}</h1>

              <h5 class="text-justify paddtext">{{forumpost.textforumpost}}</h5>
              <div>
                <div class="m-0 autorAndDate">
                  <h5 class="small text-left">Author: {{forumpost.autorforumpost || 'anonymous'}} </h5>
                  <h5 class="small text-left">Category: {{forumpost.categoryforumpost}}</h5>
                  <div class="tags">
                    <h5 class="small text-left">Tags:</h5>   
                    <div v-for="tag in forumpost.tagsforumpost" v-bind:key="tag">   
                      <h5 class="small ml-1"> {{tag}}</h5>
                    </div>
                  </div>
                </div>
                <p
                  class="small text-right m-0 autorAndDate posrel"
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
      perPage: 5,
      pages: [],
      page: 1,
      text: "",
      categories:[
        'Todos',
        'Psychology',
        'Social Life',
        'Physical',
        'Programming',
        'Mistery',
        'Others'
      ],
      category: 'Todos',
      filtercat: [] ,
      tagName:'' 
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

    paginate(categoryFilter) {
      let page = this.page;
      let perPage = this.perPage;
      let from = page * perPage - perPage;
      let to = page * perPage;
      return categoryFilter.slice(from, to);
    },
    setPaginate() {
      let numberOfPages = Math.ceil(this.categoryFilter.length / this.perPage);
      for (let i = 1; i <= numberOfPages; i++) {
        this.pages.push(i);
      }
    },
    changeCategory(cat){ 
      this.categorylist = cat
      this.category = this.category.replace(this.category, cat)
    }, 
    changetTag(tag){
      this.tagart = tag
      console.log(tag)
      this.category='nada'
      this.tagName = this.tagName.replace(this.tagName, tag)
      
    }
  },
  computed: {
    alltags() {
      let tags = this.allForumposts.map((item) => {
            if (item.tagsforumpost == '') {
                return null
            } else {
                return item.tagsforumpost
            }
        })
        let joinSplitTags = tags.join(',').split(',')
        let quantityNames = joinSplitTags.reduce((counterName, item) => {
            counterName[item] = ((counterName[item] || 0) + 1);
            return counterName;
        }, []);
        // sorter by quantity
        let sorterTags = Object.keys(quantityNames).map(e => {
            let obj = {};
            obj[e] = quantityNames[e];
            return obj;
        }).sort((a, b) => Object.values(b)[0] - Object.values(a)[0])
        let keysOrder = sorterTags.map((item) => {
            return Object.keys(item).toString()
        })
        return keysOrder
    },
    splitTags() {
        let mapTags = this.allForumposts
        mapTags.map(el => {
          if (el.tagsforumpost == null) {
              return el.tagsforumpost = ''
          } else {
              return el.tagsforumpost = el.tagsforumpost.split(',')
          }
        })
        return mapTags
    },
    paginateForumposts() {
      return this.paginate(this.categoryFilter);
    },
    isLoggedIn: function() {
      return this.$store.getters.isLoggedIn;
    },
    searchForum: function() {
      // lowercase in both sides are to turn into a case insensitive
      return this.paginateForumposts.filter(forumpost =>
        forumpost.titleforumpost.toLowerCase().includes(this.text.toLowerCase())
      )
    },
    categoryFilter(){
      if(this.category === 'Todos'){ 
          let filter1 = this.splitTags.filter((forumpost) => forumpost.titleforumpost.toLowerCase().includes(this.text.toLowerCase()))
          this.filtercat = filter1
          return this.filtercat
        } 
        else if (this.category === this.categorylist){
      
          let filter1= this.splitTags.filter((forumpost) => forumpost.categoryforumpost.includes(this.categorylist))
          let filter = filter1.filter((forumpost) => forumpost.titleforumpost.toLowerCase().includes(this.text.toLowerCase()))
          this.filtercat = filter
          return this.filtercat
        }
        else if (this.tagName === this.tagart){
          let filter1= this.splitTags.filter((forumpost) => forumpost.tagsforumpost.includes(this.tagart))
          let filter = filter1.filter((forumpost) => forumpost.titleforumpost.toLowerCase().includes(this.text.toLowerCase()))
          this.filtercat = filter
          return this.filtercat
      }
    }
  },
    watch: {
    filtercat () {  
      this.pages= []
      this.page = 1
      this.setPaginate(); 
    },
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
  padding: 1%;
  margin: 1%;
}
.margin0 {
  margin: 0%;
}
.autorAndDate {
  display: inline-block;
  width: 50%;
}
.categoryfor {
  list-style: none;
  padding: 0%;
  border: ridge;
}
.categoryfor li:hover{
  background-color: rgb(102, 109, 117);
  cursor: pointer;
}
.paddtext{
  padding-top: 4%;
  padding-bottom: 7%;
  padding-left: 4%;
  padding-right: 4%;
}
.margtop{
  margin-top: 5rem !important;
}
.querypostsdiv{
  margin-top: 5rem !important;
  
}
.categorytag{
  display: inline; 
  padding: 0%; 
}
.categorytag p{
  display: inline; 
  margin-left: 0.5rem;
  text-decoration: underline;
}
.categorytag p:hover{
  background-color: #a0e9b3;
  cursor: pointer;
}
.tags h5{
  float: left;
}
.tags div h5:hover{
  background-color: #a0e9b3;
  text-decoration: underline;
  cursor: pointer;
}
.posrel{
  position: relative;
  top: 24px;
}


/* RESPONSIVE MEDIA QUERY */
@media only screen and (max-width: 991px) and (min-width: 5px) {
  .margtop{
    margin-top: 3.5rem !important;
  }
}
@media only screen and (max-width: 715px) and (min-width: 5px) {
  .searchXSQuery {
    width: 97% !important;
    margin-bottom: 1rem !important;
    margin-top: 0.5rem !important;
  }
  .querypostsdiv{
    margin: 0% !important;
    padding: 0% !important;
  }
  .margtop{
    margin-top: 3.5rem !important;
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