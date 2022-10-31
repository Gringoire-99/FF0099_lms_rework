import {createRouter} from 'vue-router'
import {createWebHashHistory} from 'vue-router'
import HomePage from "@/components/HomePages/HomePage";
import UserPage from "@/components/HomePages/UserPage";
import LoginPage from "@/components/HomePages/LoginPage";
import RegisterPage from "@/components/HomePages/RegisterPage";
import ContactPage from "@/components/StaticPages/ContactPage";
import HelpPage from "@/components/StaticPages/HelpPage";
import JoinUsPage from "@/components/StaticPages/JoinUsPage";
import TeamPage from "@/components/StaticPages/TeamPage";
import BookListPage from "@/components/BookPages/BookListPage";
import BookRecordPage from "@/components/BookPages/BookRecordPage";

const routes = [

    {path: '/', component: HomePage},
    {
        name: 'HomePage',
        path: '/HomePage',
        component: HomePage,
    },
    {
        name: 'UserPage',
        path: '/UserPage',
        component: UserPage,
        meta: {
            isAuth: true,
        }
    },
    {
        name: 'LoginPage',
        path: '/LoginPage',
        component: LoginPage
    },
    {
        name: 'RegisterPage',
        path: '/RegisterPage',
        component: RegisterPage
    },
    {
        name: 'ContactPage',
        path: '/ContactPage',
        component: ContactPage
    },
    {
        name: 'HelpPage',
        path: '/HelpPage',
        component: HelpPage
    },
    {
        name: 'JoinUsPage',
        path: '/JoinUsPage',
        component: JoinUsPage
    },
    {
        name: 'TeamPage',
        path: '/TeamPage',
        component: TeamPage
    },
    {
        name: 'BookListPage',
        path: '/BookListPage',
        component: BookListPage,
        meta: {
            isAuth: true,
        }
    },
    {
        name: 'BookRecordPage',
        path: '/BookRecordPage',
        component: BookRecordPage,
        meta: {
            isAuth: true,
            isAdmin: true,
        }
    }
]
const router = createRouter({
    history: createWebHashHistory(),
    routes
})
export default router
