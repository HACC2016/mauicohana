# HACC Front End #

## Build / Deployment entry point ##
```
./frontend/dist/index.html
```

#### Quick Setup & Test (dev) #####


```
git clone https://github.com/HACC2016/mauicohana.git
cd mauicohana/frontend
npm install
nam run dev
```

##### Browser URL #####

```
http://localhost:8675
```

##### Deploy to Production #####


Add these to your .bash_profile or otherwise set these ENV variables. Contact Ben for credentials

```
export HACC_S3_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXXXXXXXXX
export HACC_S3_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXX
export HACC_S3_DISTRIBUTION_ID=XXXXXXXXXXXXXXXXXXXXXXX
```

From the ./www folder, run this command. It will run both build and upload.

```
npm run deploy
```

##### Browser URL #####

```
http://hacc2016.s3-website-us-east-1.amazonaws.com/ <— S3
http://d2p318xtsc4ljf.cloudfront.net/ <— Cloudfront
```

### Design Resources ###

**Foundation 6 Docs**
http://foundation.zurb.com/sites/docs/

**Foundation Material Design**
http://eucalyptuss.github.io/material-foundation/

**Font Awesome Icons**
http://fontawesome.io/icons/

**Google Material Design Icons**
https://design.google.com/icons/

### Development Resources ###

**VueJS**
Reactive 2-way binding framework


**VueRouter**
Official router of VueJS

**Vuex**
Official flux based store pattern

**VueResource**
Official async promise external resource method

# API (Rails / Puma) #

## Build / Deployment entry point ##
```
./api/public
```
