<div class="navbar navbar-default navbar-fixed-bottom" role="navigation">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="${context!}">HarLearn</a>
    </div>
    <div class="navbar-collapse collapse">

    <!-- Left nav -->
   <#include "categories.ftl">

    <#--  <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-search">Submit</button>
    </form>  -->
    <!-- Right nav -->
    <#include "profile.ftl">

    </div>
</div>