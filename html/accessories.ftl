<#import "priceFormat.ftl" as FormatPrice >
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<#if storeConfiguration.tdk ?? && ( storeConfiguration.tdk.seoTitle ??  || storeConfiguration.tdk.seoDescription ?? || storeConfiguration.tdk.seoKeyword ??)>
    <title>${(storeConfiguration.tdk.seoTitle)!}</title>
    <meta name="description" content="${(storeConfiguration.tdk.seoDescription)!}">
    <meta name="Keywords" content="${(storeConfiguration.tdk.seoKeyword)!}">
<#else>
    <title>国美电商-国美集团唯一官方综合网购商城，数码家电、日用百货、服装鞋帽,正品低价、品质保障、快速送达、安心服务！</title>
    <meta name="description" content="国美集团唯一官方综合网购商城。国美电商平台提供全球品牌电视、洗衣机、电脑、手机、空调、电脑配件、生活电器、数码家电、日用百货、服装鞋帽网购商城,正品低价、品质保障、快速送达、安心服务！有国美，生活美!">
    <meta name="Keywords" content="国美在线，国美官网，国美电商，国美电器，国美电器官方网站，国美电器网上商城，国美电商平台，国美网上商城，gome，手机，电视，洗衣机，电脑，智能数码，空调，电脑配件，生活电器，日用百货，服装鞋帽">
</#if>
<#--END-->
<!-- 启用360浏览器的极速模式(webkit)-->
<meta name="renderer" content="webkit">
<!-- 避免IE使用兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp"/>
<meta http-equiv="Cache-Control" content="no-transform"/>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta property="qc:admins" content="2500556177677556375636"/>
<meta name="applicable-device" content="pc">
<link rel="shortcut icon" href="//app.gomein.net.cn/favicon.ico" type="image/x-icon" />
<#--公共环境变量-->
<!--#include virtual="/n/common/global/global.html"-->
<#--公共环境变量 end-->
<#--公共头部css-->
<link rel="stylesheet" href="<!--#include virtual='/n/common/a50/style.html'-->">
<link rel="stylesheet" href="/css/accessories.css"/>
<#--公共头部css end-->
</head>
<!--#include virtual="/n/common/a50/head.html"-->
<body class="accessories">
<div id="delscript">
    <script type="text/javascript">
        var winWidth = window.screen.width,objb = document.body;if (winWidth<=1024) {objb.className += " " +"w1000"; }else {objb.className=objb.className.replace("w1000", '');};
    </script>
</div>
<#if (edit)??>
	<input type="hidden"  id="editModeId" editMark="${(edit)!}"   editUrl="${(storeConfiguration.gccUrl)!}"/>
</#if>
<#assign gomeImgLoad = storeConfiguration.imageserver+"/grey.gif">
<#include "firstScreen.ftl">
<#include "search.ftl">
<#include "newGood.ftl">
<#include "salesGood.ftl">
<#include "accessoriesFloor.ftl">
<#include "like.ftl">
<!--#include virtual="/n/common/a50/foot.html"-->
<!--#include virtual="/n/common/a50/aside.html"-->
<script src="<!--#include virtual='/n/common/a50/script.html'-->,gmlib/sea/seajs/3.0.0/sea.js,gmlib/sea/seajs-combo/1.0.0/seajs-combo.js"></script>
<script src="/js/accessories.js"></script>
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
</body>
</html>