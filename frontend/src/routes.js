// ***************** Routing / Pages *****************************

export default {

    /***** HOME LAYOUT PAGES ****/

    '/': {
        component: require('./layouts/Home'),
        localized: true,
        subRoutes: {
            '/': {
                t: 'public.home',
                component: require('./pages/home/Index')
            }
        }
    },

    /***** FAQS LAYOUT PAGES ****/

    '/faqs': {
        component: require('./layouts/Faqs'),
        localized: true,
        subRoutes: {
            '/': {
                t: 'public.faqs',
                component: require('./pages/faqs/Index')
            },
        }
    },

    /***** HACC LAYOUT PAGES ****/

    '/hacc': {
        localized: true,
        component: require('./layouts/Hacc'),
        subRoutes: {
            '/': {
                t: 'public.hacc.index',
                component: require('./pages/hacc/Index')
            },
        }
    },

    /***** ACCOUNT LAYOUT PAGES ****/

    '/account': {
        component: require('./layouts/Account'),
        localized: true,
        subRoutes: {
            '/': {
                auth: true,
                t: 'public.account.index',
                component: require('./pages/account/Index')
            },
            '/login': {
                auth: false,
                t: 'public.account.login',
                component: require('./pages/account/Login')
            },
            '/signup': {
                auth: false,
                t: 'public.account.signup',
                component: require('./pages/account/Signup')
            },
            '/password': {
                auth: false,
                t: 'public.account.hacc',
                component: require('./pages/account/Password')
            },
        }
    },

    /***** FARMERS MARKET LAYOUT ****/

    '/farmers-markets': {
        localized: true,
        component: require('./layouts/FarmersMarkets'),
        subRoutes: {
            '/': {
                t: 'public.markets.index',
                component: require('./pages/farmers-markets/Index'),
            },
            '/new': {
                t: 'public.markets.new',
                component: require('./pages/farmers-markets/New')
            },
            '/details': {
                t: 'public.markets.details',
                component: require('./pages/farmers-markets/Details')
            },
        }
    },

    /***** PRODUCTS & VENDORS LAYOUT ****/

    '/products-vendors': {
        localized: true,
        component: require('./layouts/ProductsVendors'),
        subRoutes: {
            '/': {
                t: 'public.vendors.index',
                component: require('./pages/products-vendors/Index')
            },
            '/listings/:id': {
                t: 'public.vendors.listings',
                component: require('./pages/products-vendors/Listings')
            },
            '/new': {
                t: 'public.vendors.new',
                component: require('./pages/products-vendors/New')
            },
            '/details/:id': {
                t: 'public.vendors.details',
                component: require('./pages/products-vendors/Details')
            },
        }
    },

    /***** EVENTS LAYOUT ****/

    '/events': {
        localized: true,
        component: require('./layouts/Events'),
        subRoutes: {
            '/': {
                t: 'public.events.details',
                component: require('./pages/events/Index')
            },
            '/new': {
                t: 'public.events.details',
                component: require('./pages/events/New')
            },
            '/details/:id': {
                t: 'public.events.details',
                component: require('./pages/events/Details')
            },
        }
    },

    /***** ERROR LAYOUT ****/

    '/error': {
        localized: true,
        component: require('./layouts/Events'),
        subRoutes: {
            '/403': {
                t: 'public.errors.403',
                component: require('./pages/403')
            },
            '/404': {
                t: 'public.errors.404',
                component: require('./pages/404')
            },
        }
    },

    /***** ADMIN LAYOUT PAGES ****/

    '/admin': {
        auth: 'admin',
        localized: true,
        component: require('./layouts/Admin'),
        subRoutes: {
            '/': {
                t: 'admin.index',
                component: require('./pages/admin/Index')
            },
        }
    },

}

