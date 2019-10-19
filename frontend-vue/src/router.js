import Vue from 'vue'
import Router from 'vue-router'
import store from './store.js'

import Inicio from './views/Inicio.vue'


Vue.use(Router)


export default new Router({

    mode: 'history',
    base: process.env.BASE_URL,
    routes: [{

            // VIEWS
            path: '/',
            name: 'Inicio',
            component: Inicio
        },
        {
            path: '/profile',
            name: 'Profile',
            component: () =>
                import ('./views/Profile.vue')
        },
        {
            path: '/users',
            name: 'Users',
            component: () =>
                import ('./views/Users.vue')
        },
        {
            path: '/forum',
            name: 'Forum',
            component: () =>
                import ('./views/Forum.vue')
        },
        {
            path: '/articles',
            name: 'Articles',
            component: () =>
                import ('./views/Articles.vue')
        },
        {
            path: '/login',
            name: 'Login',
            component: () =>
                import ('./views/Login.vue')
        },
        {
            path: '/register',
            name: 'Register',
            component: () =>
                import ('./views/Register.vue')
        },

        // COMPONENTS
        {
            path: '/addArticles',
            name: 'addArticles',
            component: () =>
                import ('./components/addArticles.vue')
        },
        {
            path: '/addForumpost',
            name: 'addForumpost',
            component: () =>
                import ('./components/addForumpost.vue')
        },
        {
            path: '/resources',
            name: 'resources',
            component: () =>
                import ('./components/resources.vue'),
            meta: {
                requiresAuth: true
            }
        },


    ]
})

// router.beforeEach((to, from, next) => {
//     if (to.matched.some(record => record.meta.requiresAuth)) {
//         if (store.getters.isLoggedIn) {
//             next()
//             return
//         }
//         next('/login')
//     } else {
//         next()
//     }
// })