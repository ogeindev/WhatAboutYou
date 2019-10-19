<template>
  <div class="Inicio">
    
    <div class="container-fluid containerHome ">
      
        <div class="row">
          <div class="col-lg-6 bg-success p-3 mInit">
            <h4>Quienes somos Lorem, ipsum dolor sit amet consectetur adipisicing elit. Laboriosam odit ea nobis dolore harum modi quasi? Debitis cum reprehenderit explicabo, accusantium pariatur soluta reiciendis molestiae beatae libero facilis dignissimos? Eius?</h4>
            <div>
              <h2>"contenido multimedia"</h2>
              <h2>"formulario de registro"</h2>
              
            </div>
          </div>
          <div class="col-lg-5 bg-warning  p-3 mChat">
            <h1>Chat</h1>
            
            
          </div>
        </div>
        
      </div>
  
    </div>
</template>

<script>


export default {
  name: 'Inicio',
  
}
</script>

<style scoped>
.containerHome {
    background-image: url("../assets/verdeinicio2.jpg");
    background-size: cover;
    background-repeat: repeat-y;
    height: 100vh;


  }

  @media only screen and (max-width: 12000px) and (min-width: 801px) {
    .mChat{
      width: 45vw !important;
      margin-left: 1%;
      float:right;
      height: 85vh;
      margin-top: 2%;
    }
    .mChat h1{
      font-size: 6vw;
    }
    .mInit{
      width: 45vw !important;
      margin-left: 2vw;
      height: 85vh;
      margin-top: 2%;
    }
    .mInit h4, h2{
      font-size: 2vw
    }
    
  }

  @media only screen and (max-width: 800px) and (min-width: 5px) {
    .mChat{
      width: 100vw !important;
      height: auto;
      margin-top: 1%;
    }
    .mInit{
      width: 100vw !important;
      height: auto;
      margin-top: 1%;
    }
   
  }

</style>