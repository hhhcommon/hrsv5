import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
    mode: 'history',
    routes: [
        {
            path: '/',
            name: 'login',
            component: () => import('@/hrds/views/login/index')
        },
        {
            path: "/home",
            name: 'home',
            component: () => import('@/hrds/components/menu'),
            children: [
                {
                    path: '/syspara',
                    name: 'syspara',
                    component: () => import('@/hrds/views/a/syspara/index')
                },
                {
                    path: '/agentdeploy',
                    name: 'agentdeploy',
                    component: () => import('@/hrds/views/b/agentdeploy/agentdeploylist')
                },
                {
                    path: '/collectmonitor',
                    name: 'collectmonitor',
                    title : '采集监控首页',
                    component: () => import('@/hrds/views/b/collectmonitor')
                }
            ]
        }
    ]
})