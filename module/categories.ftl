<ul class="nav navbar-nav" id ="treediv">
    <@categoryTag method="list">
        <#list categories as category>
        <li parentId="${category.parentId}" selfId="${category.id}" ><a href="${context!}/categories/${category.slugName!}" class="dropup">${category.name}</a></li>
        </#list>
    </@categoryTag>
</ul>