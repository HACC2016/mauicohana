<template>
    <!-- must be wrapped in div to avoid fragments -->
    <div id="hero">
        <div class="page-header text-center">
            <div class="row">
                <div class="large-12 columns">
                    <slot name="tagline"></slot>
                </div>
            </div>
            <div class="row">
                <div class="large-4 large-centered columns">
                    <div class="row">
                        <div class="large-12 columns">
                            <slot name="search"></slot>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div><!-- #hero -->
    <!--./template -->
</template>
