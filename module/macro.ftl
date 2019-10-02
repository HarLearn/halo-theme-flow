<#macro head title,keywords,description>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="author" content="CrazyIdeas">

	<@global.head />
	<meta name="keywords" content="${keywords!}"/>
    <meta name="description" content="${description!}" />
    <title>${title!}</title>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="${static!}/source/css/bootstrap.min.css"  type="text/css">
	
	<!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="${static!}/source/css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="${static!}/source/css/style.css">
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="${static!}/source/font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">
	
	<link rel="stylesheet" href="${static!}/source/css/lightbox.css">
	
	<!-- Core JavaScript Files -->  	 
    <script src="${static!}/source/js/bootstrap.min.js"></script>
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- Static navbar -->
	<#include "navbar.ftl">
	
    <header>
		<div class="logo">
			<a href="${context!}"><img src="${static!}/source/images/logo.png"></a>
		</div>
    </header>
    
	<div id="page-content" class="index-page">
		<div id="container">
			<!-- These are our grid blocks -->
			<#nested>
		</div>
		<@global.footer />
	</div>

    <!-- Once the page is loaded, initialized the plugin. -->
    <script type="text/javascript" src="${static!}/source/js/jquery-2.1.1.js" ></script>
	<script src="${static!}/source/js/bootstrap.min.js"></script>
	
	<script>
		
		var obj = document.getElementById('treediv');
		var liList = [];
		liList = obj.getElementsByTagName('li');
		function htmltojson(liList){
			result = [];
			for(var i = 0; i < liList.length; i++){
				var obj = {
					id:liList[i].getAttribute('selfId'),
					innerHtmls:liList[i].innerHTML,
					pid:liList[i].getAttribute('parentId')
				};
				result.push(obj);
			}
			return result;
		}

		function trans_json_tree(jsonData){
		    var result = [], temp = {}, len = jsonData.length
		    for(var i = 0; i < len; i++){
		        temp[jsonData[i]['id']] = jsonData[i] 
		    }
		    for(var j = 0; j < len; j++){
		        var currentElement = jsonData[j]
		        var tempCurrentElementParent = temp[currentElement['pid']] 
		        if (tempCurrentElementParent) { 
		          if (!tempCurrentElementParent['children']) { 
		            tempCurrentElementParent['children'] = [] 
		          }
		          tempCurrentElementParent['children'].push(currentElement) 
		        } 
		        else { 
		            result.push(currentElement);
		        }
		    }
		    return result;
		}

		function jsonToHTMLString (jsonTreeData){
			var result = "";
			for(var i = 0; i < jsonTreeData.length; i++){
				result += "<li>" + jsonTreeData[i].innerHtmls;
				if(jsonTreeData[i].children != null && jsonTreeData[i].children.length>0){
					var tes = jsonToHTMLString(jsonTreeData[i].children);
					result = result.substring(0,result.length - 4);
					result += "<span class=\"caret\"></span></a>";
					result += "<ul class=\"dropdown-menu\" >" + tes + "</ul>";
				}
				result += "</li>";
			}
			return result;
		}
		
		//var strHtml = "<a href=\"#\" class=\"dropup\">测试</a>";
		var jsonTree = trans_json_tree(htmltojson(liList))
		var strHtml = jsonToHTMLString(jsonTree);
		document.getElementById("treediv").innerHTML = "";
		$("#treediv").append(strHtml);

	</script>

	<!-- jQuery Pinterest -->
    <script type="text/javascript" src="${static!}/source/js/jquery.pinto.js"></script>
    <script type="text/javascript" src="${static!}/source/js/main.js"></script>
	
	<!-- SmartMenus jQuery plugin -->
    <script type="text/javascript" src="${static!}/source/js/jquery.smartmenus.js"></script>

    <!-- SmartMenus jQuery Bootstrap Addon -->
    <script type="text/javascript" src="${static!}/source/js/jquery.smartmenus.bootstrap.js"></script>
	
	<script src="${static!}/source/js/lightbox-plus-jquery.min.js"></script>

	
</body>

</html>
</#macro>