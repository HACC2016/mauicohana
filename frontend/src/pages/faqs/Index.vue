<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>

        <h2 class="hidden">FAQs</h2>

        <main class="site-content large-12 columns">
            <div class="page-content">

                <ul class="accordion" data-accordion role="tablist">
                    <li class="accordion-item is-active">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">&ldquo;Made in Hawaii&rdquo; Initiative</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            Grow Hawaii’s agriculture food and products industry by connecting local, national and international buyers to local companies.
                        </div>
                    </li>
                    <li class="accordion-item">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Demand for Hawaii Products by Locals</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <p>Vendors</p>
                            <ul>
                                <li>Over 400 vendors participated in the 2016 &ldquo;Made in Hawaii&rdquo; Festival</li>
                                <li>Over 45,000 people attended last year&rsquo;s event</li>
                                <li>Local restaurants using local ingredients</li>
                            </ul>
                            <hr />
                            <p>Farmers Makets</p>
                            <ul>
                                <li>Popularity of Farmers&rsquo; Markets increasing</li>
                                <li>Over 200 estimated Farmers&rsquo; Markets statewide</li>
                                <li>Over 70 here Oahu</li>
                            </ul>
                        </div>
                    </li>
                    <li class="accordion-item">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Hawaii Products Growing Worldwide</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <ul>
                                <li>Natural health products like Noni are requested</li>
                                <li>Tradeshows spark interest in Hawaii products</li>
                                <li>Disasters in foreign countries have lead to requests for products</li>
                            </ul>
                        </div>
                    </li>
                    <li class="accordion-item">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Who Qualifies as Hawaii Agriculture Food & Products</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <ul>
                                <li>Companies licensed to do business in Hawaii offering Hawaii food & products</li>
                                <li>Must be 100% grown or value-added products with at least 50% of inputs from Hawaii</li>
                            </ul>
                        </div>
                    </li>
                    <li class="accordion-item">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Case Study: Tane Datta, Adaptations/Oceanfire</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <ul>
                                <li>transformed overgrown land on the slopes of Mauna Loa in Honaunau into a salad bowl. Everywhere you turn, you’ll find something delectable: kale, watermelon radishes, Swiss chard, fennel, asparagus, spearmint, opal basil, edible flowers and more</li>
                                <li>collaborates with the chefs of 70 hotels and restaurants statewide to raise what they need, while also making sure he and the other Hawai&rsquo;i Island Farmers he distributes for can provide a stable supply of products at a fair price</li>
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
        </main>
    </div>
    <!--./template -->
</template>
<style>

</style>
<script>
    export default {

        data () {
            return {
                page_title: 'Page Name',
            }
        },
        methods: {

        },
        computed: {

        },
        ready(){

        },
        // -- seo config for this page
        head: {
            title () {
                return {
                    inner: 'Hawaii Depart of Agriculture',
                    separator: '-',
                    complement: this.page_title
                }
            },
            meta: [
                {
                    name: 'description',
                    content: '...'
                },
            ]
        }
    }
</script>
