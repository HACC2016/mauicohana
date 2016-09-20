<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div>

        <h2 class="hidden">HACC Challenge</h2>

        <main class="site-content large-12 columns">
            <div class="page-content">

                <ul class="accordion" data-accordion role="tablist">
                    <li class="accordion-item is-active">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Goals</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <ul>
                                <li>Grow Hawaii&rsquo;s agriculture food and products industry by connecting local, national and international buyers to local companies</li>
                                <li>Reduce HDOA dependency for keeping information current</li>
                                <li>Support the Farmers Market organizers (big and small)</li>
                                <li>Support our local farmers and vendors</li>
                            </ul>
                        </div>
                    </li>
                    <li class="accordion-item">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Issues</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <ul>
                                <li>Web searches provide links to organizers own websites, blog sites, visitor sites, etc.</li>
                                <li>Search on Yelp for random results</li>
                                <li>Not all vendors have website</li>
                                <li>HDOA has a statewide listing on data.hawaii.gov but it is out of date</li>
                                <li>With markets popping up, relocating or closing, reduced staff was unable to keep up</li>
                            </ul>
                        </div>
                    </li>
                    <li class="accordion-item">
                        <a href="#panel1d" @click.prevent="" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Develop an online app where local, national and international <strong>buyers</strong>&hellip;</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <ul>
                                <li>can do multiple searches (i.e. Certified Organic, papaya, sold on Oahu, vendor, product, product description or Harmonized System Code [international buyers]])</li>
                                <li>are provided most current information</li>
                                <li>search results can be displayed and downloaded in pdf format (with email and web links)</li>
                                <li>can contact seller directly</li>
                                <li>can generate email request to search result companies / generate email request to vendor generated from search results (should identify buyer&rsquo;s name and/or company, product, destination, etc.)</li>
                                <li>
                                    <p><strong>The challenge asked for search results with email addresses of the businesses displayed? Is there a reason for that? It also mentioned having a way to generate an email request. Does that mean there should be a contact form?</strong></p>
                                    <p>We are basically looking for an easy way for the buyer to contact the vendor. What will the buyer see when he/she does a search and how can they easily contact all the companies that were listed. Generation of emails was just a suggestion.</p>
                                </li>
                                <li>
                                    <p><strong>The challenge also asked for results in a PDF format. Is there a reason for that?</strong></p>
                                    <p>Regarding PDF format, we just wanted the buyers an option to print or create a PDF file of the search results.</p>
                                </li>
                                <li>
                                    <p><strong>Is there a specific term used to identify those products that qualify as local products (i.e. Made In Hawaii, Buy Local, Island Fresh)? There is not a specific term for 100% grown or value-added products with at least 51% of input from Hawaii</strong></p>
                                    <p>However recent legislation was passed to protect “Made in Hawaii” products. Check out the Made in Hawaii with Aloha website at: http://hdoa.hawaii.gov/madewithaloha/</p>
                                </li>
                                <li>can engage with and go to Hawaii&rsquo;s Farmers&rsquo; Markets</li>
                                <li>search for Farmers&rsquo; Markets depending on day of week, location, link to website, etc</li>
                                <li>view Farmers&rsquo; Markets on a map</li>
                                <li>view comment on and rate (stars) Farmers&rsquo; Markets</li>
                            </ul>
                        </div>
                    </li>
                    <li class="accordion-item">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Develop an online app where <strong>vendors</strong>&hellip;</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <ul>
                                <li>can list/update their company information</li>
                                <li>can enter/update product information being sold (include Harmonized System Code if product sold internationally)</li>
                                <li>can enter/update products where products sold locally</li>
                                <li>can add additional products as demand dictates</li>
                                <li>HS codes separated by commas – allow for minimum 20 codes). For test purposes, you can use random 10-digit codes or look up codes at http://www.foreign-trade.com/reference/hscode.htm</li>
                            </ul>
                            <hr />
                            <p>FIELDS FOR VENDOR INFORMATION</p>
                            <ul>
                                <li>Vendor name</li>
                                <li>Products (i.e. produce, coffee, plants, etc.)</li>
                                <li>Harmonized System Code (HS Code)</li>
                                <li>Where products are locally sold (i.e. Foodland, KCC Farmer&rsquo;s Market, KTA, etc.)</li>
                            </ul>
                            <hr />
                            <p>Harmonized System Code (HS Code) – 10 digit code (for international business)</p>
                            <p>The Harmonized Commodity Description and Coding System, also known as the Harmonized System (HS) of tariff nomenclature is an internationally standardized system of names and numbers to classify traded products.</p>
                            <p><strong>Is the HS Code commonly used? Would the normal user of the app know what an HS code is?</strong></p>
                            <div>The HS code is mostly used by international buyers/vendors. The number of inquiries from international buyers are increasing so we wanted to make sure the database would accommodate a way for vendors to enter their product’s HS codes and for buyers to search by it.</div>
                            <hr />
                            <p>VENDOR WORKFLOW</p>
                            <ul>
                                <li>Run through a brief online questionnaire to see if they meet qualification (Must be 100% grown or value added products with at least 50% of inputs from Hawaii, have a valid Hawaii Business Registration Number)</li>
                                <li>If vendor meets qualification, then they can proceed to enter company information, setup logon and password, enter product information</li>
                                <li>Create confirmation page for vendor to attest all information entered is “True”</li>
                                <li>Entry submitted to HDOA.MD@hawaii.gov for verification. When approved, record uploaded to website</li>
                            </ul>
                            <ul>
                                <li>
                                    <p><strong>Does a company only need to fill out the company registration information once, then enter their product info (as opposed to entering their company information each time they want to enter a new product)?</strong></p>
                                    <p>Yes, company needs to register once but be able to access only their records to keep it up to date.</p>
                                </li>
                                <li>
                                    <p><strong>As for verification from the state, does the company information have to be verified/approved by the state first? Or just the product? Or will both the business and product be verified when a new company registers on the site (and therefore only subsequent products have to be verified later)?</strong></p>
                                    <div>The HDOA would like to verify/approve the company and their products initially. After submission is approved, companies should be able to update their products and other information without additional approval from HDOA. Approval should not require reentry of information and maybe automatically notify the company. I will check with the program if they would like notification or not when things are changed. We would like to easily send reminders for companies to keep their information up to date.</div>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="accordion-item">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Develop an online app where Farmers&rsquo; Market & Event <strong>organizers</strong>&hellip;</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <p>can list/update their:</p>
                            <ul>
                                <li>locations</li>
                                <li>dates / times</li>
                                <li>contact info</li>
                                <li>vendors</li>
                                <li>products</li>
                                <li>photo galleries</li>
                                <li>&ldquo;What&rsquo; Happening&rdquo; or special events</li>
                            </ul>
                            <hr />
                            <p>FIELDS FOR FARMER&rsquo;S MARKET (*fields required to be entered by organizer)</p>
                            <ul>
                                <li>Farmers Market Name*</li>
                                <li>Day(s) of week* (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)</li>
                                <li>Start and end time*</li>
                                <li>Street Address*</li>
                                <li>City*</li>
                                <li>Zip code*</li>
                                <li>Island*</li>
                                <li>Additional Location information</li>
                                <li>Website</li>
                                <li>Organizer Contact Name*</li>
                                <li>Organizer Phone Number*</li>
                                <li>Organizer Email*</li>
                                <li>Organizer login name*</li>
                                <li>Organizer password*</li>
                                <li>Date modified (mm/dd/ccyy)</li>
                            </ul>
                            <hr />
                            <p>FIELDS FOR EVENT INFORMATION</p>
                            <ul>
                                <li>Event Name</li>
                                <li>Date(s) of event (mm/dd/ccyy)</li>
                                <li>Event description</li>
                            </ul>
                        </div>
                    </li>
                    <li class="accordion-item">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Develop an online app where HDOA <strong>admins</strong>&hellip;</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <ul>
                                <li>can review submittals to verify qualification</li>
                                <li>can easily contact organizers</li>
                                <li>can delete closed business and Farmers&rsquo; Markets if necessary</li>
                                <li>will receive email to: HDOA.MD@hawaii.gov</li>
                            </ul>
                        </div>
                    </li>
                    <li class="accordion-item">
                        <a href="#panel1d" role="tab" class="accordion-title" id="panel1d-heading" aria-controls="panel1d">Resources</a>
                        <div id="panel1d" class="accordion-content" role="tabpanel" data-tab-content aria-labelledby="panel1d-heading">
                            <ul>
                                <li>Data from the previous Hawaii Agriculture Food and Products database available at ETS hub in .csv format</li>
                                <li>Sample Farmers&rsquo; Markets data available at ETS Hub or at data.hawaii.gov</li>
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
