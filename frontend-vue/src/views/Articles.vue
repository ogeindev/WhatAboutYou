<template>
  <div class="Articles">
    <pre></pre>
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-8">
          <div class="bg-warning margtop">
            <!-- <h1 class="pt-3"><router-link to="/addArticles">ADD AN ARTICLE!</router-link></h1> -->
            <span  v-if="isLoggedIn"> <h1 class="pt-3"><router-link to="/addArticles">ADD AN ARTICLE!</router-link></h1> </span>
            <span  v-else>  <h2 class="pt-3"> <router-link to="/register">Sign up</router-link> to add an article  or <router-link to="/login">Sign in</router-link> if you are already registered</h2></span>
          </div>

          
            <input  class="searchXSQuery form-control w-50 float-right " v-model="text"  placeholder="Search" aria-label="Search">  
         

          <!-- Pagination -->
          <div class="container d-none d-sm-block">
            <div class="row ">
              <div class="btn-group col-md-2 offset-md-5 ml-0 pl-0">
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

  
          <!-- hay que cargar primero el metodo y luego mostrar los usuarios -->
          
            <div class="card mb-3 mt-3" v-for="article in paginateArticles" v-bind:key="article.id_article">
              <div class="card-header">
                <h1>{{ article.titlearticle}}</h1>
              </div>
              <div class="card-body">
                <h5 class="text-justify">{{ article.textarticle}}</h5>
              </div>
              <div class="card-footer">
                <div class="float-left m-0 autorAndDate">
                  <h5 class="small text-left">Author: {{article.autorarticle || 'anonymous'}} </h5>
                  <h5 class="small text-left">Category: {{article.categoryarticle}}</h5>
                  <div class="tags">
                    <h5 class="small text-left">Tags:</h5>   
                    <div v-for="tag in article.tagsarticle" v-bind:key="tag">   
                      <h5 class="small ml-1"> {{tag}}</h5>
                    </div>
                  </div>
                </div>
                <p class="small text-right m-0 autorAndDate posrel">{{article.data_created | moment("calendar")  }}</p>
              </div> 
              
            </div>
          
          <!-- Pagination -->
          <div class="container ">
            <div class="row">
              <div class="btn-group col-md-2 offset-md-5">
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
          
        
        

        <div  class="col-lg-3 bg-white mt-3 heighCatEtq sideBarQuery">
          <div >
            <h3>Categories</h3>
            <hr />
            <ul  class="categoryfor" v-for="categorylist in categories" v-bind:key="categorylist">
              <li  @click="changeCategory(categorylist)">{{categorylist}}</li>
            </ul>
           
           
            <br />
          </div>
          <div>
            <h3>Tags</h3>
            <hr />
            <div class="categorytag" v-for="tagart in alltags" v-bind:key="tagart">
              <p  v-on:click="changetTag(tagart)">{{tagart}} </p>
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
  el:'.Articles',
  data(){
    return{
      allArticles: [],
      perPage: 5,
      pages: [],
      page: 1,
      text: '',
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
      filtercat: [],  
      tagName:'',      
    }
  },
  mounted: function() {
     this.getArticles() 
  },
  methods: {
    
     getArticles(){ 
       axios.get('http://localhost:3000/getArticles')
      .then( 
        (response) => {this.allArticles = response.data}
        )
      .catch(error => {
        if (!error.response) {
            // network error
            this.errorStatus = 'Error: Network Error';
        } else {
            this.errorStatus = error.response.data.message;
        }
      })
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
      console.log(cat)
      this.category = this.category.replace(this.category, cat)
    }, 
    changetTag(tag){
      this.tagart = tag
      console.log(tag)
      this.category='nada'
      this.tagName = this.tagName.replace(this.tagName, tag) 
    },
    asd(){
      this.$router.go()
    },
  },
  computed: {  
    alltags() {
      
       let tags = this.allArticles.map((item) => {
            if (item.tagsarticle == '') {
                return null
            } else {
                return item.tagsarticle
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
        let mapTags = this.allArticles
        mapTags.map(el => {
          if (el.tagsarticle == null) {
              return el.tagsarticle = ''
          } else {
              return el.tagsarticle = el.tagsarticle.split(',')
          }
        })
        return mapTags
    },
    paginateArticles() { 
      return  this.paginate(this.categoryFilter);
    },
    isLoggedIn: function() {
      return this.$store.getters.isLoggedIn;
    },
    searchArticles: function() {
      // lowercase in both sides are to turn into a case insensitive
      return this.allArticles.filter((article) => article.titlearticle.toLowerCase().includes(this.text.toLowerCase()))
    },
    categoryFilter(){
       if(this.category === 'Todos'){ 
          let filter1 = this.splitTags.filter((article) => article.titlearticle.toLowerCase().includes(this.text.toLowerCase()))
          this.filtercat = filter1
          return this.filtercat
        } 
       else if (this.category === this.categorylist){
      
          let filter1= this.splitTags.filter((article) => article.categoryarticle.includes(this.categorylist))
          let filter = filter1.filter((article) => article.titlearticle.toLowerCase().includes(this.text.toLowerCase()))
          this.filtercat = filter
          return this.filtercat
        }
        else if (this.tagName === this.tagart){
          let filter1= this.splitTags.filter((article) => article.tagsarticle.includes(this.tagart))
          let filter = filter1.filter((article) => article.titlearticle.toLowerCase().includes(this.text.toLowerCase()))
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
.margtop{
  margin-top:4rem;
 
}
.margtop h1, h2{ 
  background-color: #6ebe82;
}
.posrel{
  position: relative;
  top: 47px;
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
  background-color: forestgreen;
  cursor: pointer;
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

.container-fluid {
  background-image: url("../assets/verdeusers.jpg");
  background-size: cover;
  background-repeat: repeat-y;
  height: auto;
}

.heighCatEtq{
  height: 20%;
  margin-top: 4rem !important;
  margin-bottom: 4rem;
  padding-top: 1%;
  margin-left: 4%;
  padding-bottom: 5%;
  width: 33%;
}
  .heighCatEtq h3{
    background-color: #6ebe82;
  }
  .tags h5{
    float: left;
  }

  .tags div h5:hover{
    background-color: #a0e9b3;
    text-decoration: underline;
    cursor: pointer;
  }
  
  /* RESPONSIVE MEDIA QUERY */  
  @media only screen and (max-width: 600px) and (min-width: 5px)  {  
    .searchXSQuery{
      width: 100% !important;
      margin-bottom: 1rem;
    }
  }
  @media only screen and (max-width: 1000px) and (min-width: 5px)  {  
    .sideBarQuery{
      width: 90% !important;
      
    }
  }
</style>