<template>
  <div class="paginate">
    <paginate>
      <div class="container">
        <div class="row">
          <div class="btn-group col-md-2 offset-md-5">
            <button
              class="btn btn-sm btn-outline-secondary"
              type="button"
              v-if="page != 1"
              @click="page--"
            >Before</button>
            <button
            @click="page = pageNumber"
              type="button"
              class="btn btn-sm btn-outline-secondary"
              v-for="pageNumber in pages.slice(page-1, page+5)"
              :key="pageNumber"
            >{{pageNumber}}</button>
            <button
              class="btn btn-sm btn-outline-secondary"
              type="button"
              @click="page++"
              v-if="page < pages.length"
            >Next</button>
          </div>
        </div>
      </div>
    </paginate> 
  </div>
</template>

<script>
  export default {
    name:"paginate",
    
  }
</script>