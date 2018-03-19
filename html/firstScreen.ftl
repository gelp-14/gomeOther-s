<div class="category-box">
    <div class="category wbox">
        <div class="sidecategory">
            <h2>全部商品分类</h2>
            <#if children.head ?? &&  children.head.children ?? && children.head.children.category ?? && children.head.children.category.children ?? && children.head.children.category.children.one_category ?? && children.head.children.category.children.one_category.templates ?? && children.head.children.category.children.one_category.templates?size &gt; 0>
                <div id="navBox" class="lisnav" >
                    <div class="lisbg"></div>
                    <ul class="lisnav-ul" id="lisnav">
                        <#list children.head.children.category.children.one_category.templates as listnav>
                            <li>
                                <span class="listname edit-mode" modelId="${(listnav.children.one_category_name.modelId)!}" modelType="${(listnav.children.one_category_name.modelType)!}">
                                    <a <#if listnav.children?? && listnav.children.one_category_name ?? && listnav.children.one_category_name.linkList ?? && listnav.children.one_category_name.linkList[0] ?? && listnav.children.one_category_name.linkList[0].href ?? >href="${(listnav.children.one_category_name.linkList[0].href)!}" target="_blank"</#if> data-code="${(listnav.children.one_category_name.modelId)!}">${(listnav.children.one_category_name.linkList[0].textOtherAttr.elemenlName)!}</a>
                                </span>
                                <#if listnav.children ?? && listnav.children.two_category_name ?? && listnav.children.two_category_name.linkList ?? && listnav.children.two_category_name.linkList?size &gt;0>
                                    <div class="edit-mode" modelId="${(listnav.children.two_category_name.modelId)!}" modelType="${(listnav.children.two_category_name.modelType)!}">
                                        <#list listnav.children.two_category_name.linkList as link>
                                            <a <#if link.href ??> href="${(link.href)!}" target="_blank"</#if> data-code="${(listnav.children.two_category_name.modelId)!}-${link_index+1}">${(link.textOtherAttr.elemenlName)!}</a>
                                        </#list>
                                    </div>
                                </#if>
                            </li>
                        </#list>
                    </ul>
                </div>
            </#if>
        </div>
        <#if children.head ?? && children.head.children ?? && children.head.children.nav ?? && children.head.children.nav.linkList ?? && children.head.children.nav.linkList?size &gt; 0>
            <ul class="mainnav edit-mode" modelId="${(children.head.children.nav.modelId)!}" modelType="${(children.head.children.nav.modelType)!}">
                <li>
                <#list children.head.children.nav.linkList as link>
                    <a <#if link.href ??>href="${(link.href)!}" target="_blank"</#if> data-code="${(children.head.children.nav.modelId)!}-${link_index+1}">${(link.textOtherAttr.elemenlName)!}</a>
                </#list>
                </li>
            </ul>
        </#if>
    </div>
</div>
<div class="focus_banner clearfix">
    <div class="focus_bg"></div>
    <div class="wbox">
        <!--焦点图-->
        <div id="slideBox" class="slideBox">
            <#if children.head ?? && children.head.children ?? && children.head.children.focus?? && children.head.children.focus.imgList ?? && children.head.children.focus.imgList ?size &gt; 0>
                <#if children.head.children.focus.imgList ?size &gt; 1>
                    <div class="hd">
                        <ul>
                            <#list children.head.children.focus.imgList as list>
                                <li <#if list_index == 0>class="on"</#if>></li>
                            </#list>

                        </ul>
                    </div>
                </#if>
                <div class="bd edit-mode" modelId="${(children.head.children.focus.modelId)!}" modelType="${(children.head.children.focus.modelType)!}">
                    <ul>
                        <#list children.head.children.focus.imgList as list>
                            <li <#if list_index == 0>style="display: list-item;"</#if>>
                                <a <#if list.href ??>href="${(list.href)!}" target="_blank"</#if> data-code="${(children.head.children.focus.modelId)!}-${list_index+1}">
                                    <img class="gload-bgimg"  src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(list.src)!}" width="550" height="400" alt="${(list.imgOtherAttr.elemenlName)!}"/>
                                </a>
                            </li>
                        </#list>
                    </ul>
                </div>
                <#if children.head.children.focus.imgList ?size &gt; 1>
                    <a class="prev" onselectstart="return false"><span class="btn-bg"></span><span class="arrow"></span></a>
                    <a class="next" onselectstart="return false"><span class="btn-bg"></span><span class="arrow"></span></a>
                </#if>
            </#if>
        </div>
        <!--广告位-->
        <#if children.head ?? && children.head.children ?? && children.head.children.activity ?? && children.head.children.activity.imgList ?? && children.head.children.activity.imgList ?size &gt; 0>
            <div class="focus_right edit-mode" modelId="${(children.head.children.activity.modelId)!}" modelType="${(children.head.children.activity.modelType)!}">
                <#list children.head.children.activity.imgList as imgs>
                    <a <#if imgs.href ?? >href="${(imgs.href)!}" target="_blank"</#if> class="focus_right${imgs_index+1}" data-code="${(children.head.children.activity.modelId)!}-${imgs_index+1}">
                        <img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(imgs.src)!}" alt="${(imgs.imgOtherAttr.elemenlName)!}" <#if imgs_index == 0 || imgs_index == 1>width="202" height="230"<#else>width="420" height="155"</#if>/>
                    </a>
                </#list>
            </div>
        </#if>
        <!--窄屏广告位-->
        <#if children.head ?? && children.head.children ?? && children.head.children.activity_zhai ?? && children.head.children.activity_zhai.imgList ?? && children.head.children.activity_zhai.imgList ?size &gt; 0>
            <div class="w1000_focus_right edit-mode" modelId="${(children.head.children.activity_zhai.modelId)!}" modelType="${(children.head.children.activity_zhai.modelType)!}">
                <#list children.head.children.activity_zhai.imgList as img>
                    <a  <#if img.href ??>href="${(img.href)!}" target="_blank"</#if> class="focus_right${img_index+1}" data-code="${(children.head.children.activity_zhai.modelId)!}-${img_index+1}">
                        <img  src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(img.src)!}" alt="${(img.imgOtherAttr.elemenlName)!}" width="220" height="200"/>
                    </a>
                </#list>
            </div>
        </#if>
    </div>
</div>