<template>
    <li>

        <a v-if="category.parent_id"
                class="subitem" href="#" :class="{'is-active': is_expanded}" @click.prevent="selectMe">
            <i class="fa fa-check" :class="{'faded': !selected}"></i> {{category.name}}
        </a>
        <a v-else="category.parent_id"
           class="subitem" href="#" :class="{'is-active': is_expanded}">{{category.name}}
        </a>



        <ul v-if="category.children" class="menu vertical" :class="ul_class_object">
            <category-item
                v-for="child in category.children | filterBy $parent.category_search in 'name'"
                :category="child"
                :sublevel="next_sublevel"
                :class="{'is-active': is_expanded}"
            ></category-item>
        </ul>

    </li>
</template>
<style>
    a.subitem > i.faded{
        opacity: 0.2;
        color:#dedede;
    }
    a.subitem > i.faded{
        opacity: 1;
    }
</style>
<script>
    import {toggleCategoryFilter, filtersChanged} from '../vuex/actions'
    export default{
        vuex: {
            getters: {
                getFilters: state => state.selected_filters
            },
            actions: {
                toggleCategoryFilter, filtersChanged
            }
        },
        name: 'category-item',
        data(){
            return {
                selected: false
            }
        },
        props: ['category', 'sublevel'],
        methods: {
          selectMe(){
              this.selected = !this.selected
              this.toggleCategoryFilter(this.category,this.selected)
              this.$root.$broadcast('filtersChanged')
              console.log('dispatch that filters changed')
          }
        },
        computed: {
            sublevel_class(){
                return 'sublevel-' + this.sublevel
            },
            next_sublevel(){
                return this.sublevel + 1

            },
            ul_class_object(){

              return {
                  'is-active': this.is_expanded,
                  [this.sublevel_class]: true
              }
            },
            is_expanded(){
                return (this.category.parent_id==null)
            }
        },
        filters: {

        },
        ready(){

        }
    }
</script>
