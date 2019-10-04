<#include "module/macro.ftl">
<@head title="分类：${category.name} · ${options.blog_title!'Flower'}" keywords="${options.seo_keywords!'Flower'}" description="${options.seo_description!'Flower'}">
    <#list posts.content as post>
        <div class="item">
            <a class="example-image-link" href="${post.thumbnail}" data-lightbox="example-set" data-title="Click the right half of the image to move forward.">
            <img class="example-image" src="${post.thumbnail}" alt=""/></a>
            <div class="content-item">
                <span class="time">
                <#list post.categories as category>
                <a class="btn btn-${category.id}">${category.name}</a> 
                </#list>
                ${post.editTime}</span>
                <h3 class="title-item"><a href="${context!}/archives/${post.url}">${post.title}</a></h3>
                <p class="info">${post.summary}</p>
                <ul class="list-inline">
                    <li><a href="#"><i class="fa fa-eye"></i> ${post.visits}</a></li>
                    <li><a href="#"><i class="fa fa-heart"></i> ${post.likes}</a></li>
                </ul>
            </div>
        </div>
    </#list>
</@head>