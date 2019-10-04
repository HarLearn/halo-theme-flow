<div class="navbar navbar-default navbar-fixed-bottom" role="navigation">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="${context!}">${options.blog_title!}</a>
    </div>
    <div class="navbar-collapse collapse">

    <!-- Left nav -->
   <#include "categories.ftl">
    <!-- Right nav -->
    <#include "profile.ftl">

    </div>
</div>