<div class="accessoriesFloor">
    <div class="wbox">
        <!--品牌 新品 特殊楼层-->
        <#if children.new ?? && children.new.children ??>
            <div class="floor brand_floor" data-title="${(children.new.modelName)!}">
                <div class="newgood_top">
                    <h2><span class="line"></span><span class="floor_name">1F ${(children.new.modelName)!}</span></h2>
                    <#if children.new.children.hot ?? && children.new.children.hot.linkList?? && children.new.children.hot.linkList?size &gt; 0>
                        <div class="more edit-mode" modelId="${(children.new.children.hot.modelId)!}" modelType="${(children.new.children.hot.modelType)!}">大家都在看：
                            <#list children.new.children.hot.linkList as list>
                                <a <#if list.href ??>href="${(list.href)!}" target="_blank"</#if> data-code="${(children.new.children.hot.modelId)!}-${list_index+1}" <#if !list_has_next>class="last"</#if> >${(list.textOtherAttr.elemenlName)!}</a>
                            </#list>
                        </div>
                    </#if>
                </div>
                <#if children.new.children.brand ?? && children.new.children.brand.templates ?? && children.new.children.brand.templates?size &gt; 0>
                    <div class="brandNew clearfix">
                        <#list children.new.children.brand.templates as temp>
                            <ul <#if temp_index == 0>class="first"</#if>>
                                <li class="brandNew_name">${(temp.modelName)!}</li>
                                <#if temp.children ?? && temp.children.pic ?? && temp.children.pic.imgList ?? && temp.children.pic.imgList?size &gt; 0>
                                    <#assign imgList = temp.children.pic.imgList>
                                    <li class="brand_first edit-mode" modelId="${(temp.children.pic.modelId)!}" modelType="${(temp.children.pic.modelType)!}">
                                        <a <#if imgList[0].href??> href="${(imgList[0].href)!}" target="_blank"</#if> data-code="${(temp.children.pic.modelId)!}">
                                            <img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(imgList[0].src)!}" alt="${(imgList[0].alt)!}" <#if temp_index == 0>width="345" height="190"<#else>width="312" height="190"</#if>/>
                                        </a>
                                    </li>
                                </#if>
                                <#if temp.children ?? && temp.children.product ?? && temp.children.product.prdList ?? && temp.children.product.prdList?size &gt; 0>
                                    <#list temp.children.product.prdList as prd>
                                        <li class="edit-mode" modelId="${(temp.children.product.modelId)!}" modelType="${(temp.children.product.modelType)!}">
                                            <dl>
                                                <dd class="good">
                                                    <a <#if prd.detailHref ?? >href="${(prd.detailHref)!}" target="_blank"</#if> class="good_name" data-code="${(temp.children.product.modelId)!}-${prd_index+1}" title="${(prd.name)!}">${(prd.name)!}</a>
                                                    <a <#if prd.detailHref ?? >href="${(prd.detailHref)!}" target="_blank"</#if> class="good_longDesc" data-code="${(temp.children.product.modelId)!}-${prd_index+1}" title="<#if prd.affixAttr ?? && prd.affixAttr.longDesc ??> ${(prd.affixAttr.longDesc)!}<#else>${(prd.description)!}</#if>">
                                                    <#if prd.affixAttr ?? && prd.affixAttr.longDesc ??>
                                                        ${(prd.affixAttr.longDesc)!}
                                                    <#else>
                                                        ${(prd.description)!}
                                                    </#if>
                                                    </a>
                                                    <div class="good_price" data-target="p-price"  data-skuId="${(prd.skuId)!}">¥<i class="minPrice"><@FormatPrice.priceFormat curprice=prd.price /></i></div>
                                                </dd>
                                                <dd class="good_img">
                                                    <a <#if prd.detailHref ?? >href="${(prd.detailHref)!}" target="_blank"</#if> data-code="${(temp.children.product.modelId)!}-${prd_index+1}" title="${(prd.name)!}">
                                                    <#if prd.manualImg ?? >
                                                        <img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${prd.manualImg}" alt="${(prd.name)!}" width="100" height="100"/>
                                                    <#else>
                                                        <img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(prd.goodsImgs[0].src)!}_100.jpg" alt="${(prd.name)!}" width="100" height="100"/>
                                                    </#if>
                                                    </a>
                                                </dd>
                                            </dl>
                                        </li>
                                    </#list>
                                </#if>
                            </ul>
                        </#list>
                    </div>
                </#if>
                <#if children.new.children.logo ?? && children.new.children.logo.imgList ?? && children.new.children.logo.imgList?size &gt;0>
                    <div class="brand_logo edit-mode" modelId="${(children.new.children.logo.modelId)!}" modelType="${(children.new.children.logo.modelType)!}">
                        <#list children.new.children.logo.imgList as img>
                            <a <#if img.href ??>href="${(img.href)!}" target="_blank"</#if> data-code="${(children.new.children.logo.modelId)!}-${img_index+1}"><img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(img.src)!}" alt="" width="150" height="76"/></a>
                        </#list>
                    </div>
                </#if>
            </div>
        </#if>

        <!--循环楼层-->
        <#if children.floorOther ?? &&  children.floorOther.templates ?? &&  children.floorOther.templates?size &gt; 0>
            <#list children.floorOther.templates as temps>
                <div class="floor" data-title="${(temps.modelName)!}">
                    <div class="newgood_top">
                        <h2><span class="line"></span><span class="floor_name">${temps_index+2}F ${(temps.modelName)!}</span></h2>
                        <#if temps.children ?? && temps.children.hot?? && temps.children.hot.linkList ?? && temps.children.hot.linkList?size &gt;0 >
                            <div class="more edit-mode" modelId="${(temps.children.hot.modelId)!}" modelType="${(temps.children.hot.modelType)!}">大家都在看：
                                <#list temps.children.hot.linkList as link>
                                    <a <#if link.href ??>href="${(link.href)!}" target="_blank"</#if> data-code="${(temps.children.hot.modelId)!}-${link_index+1}" <#if !link_has_next>class="last"</#if>>${(link.textOtherAttr.elemenlName)!}</a>
                                </#list>
                            </div>
                        </#if>
                    </div>
                    <div class="floor_loop">
                        <div class="clearfix floor_wd">
                            <div class="loop_left clearfix">
                                <#if temps.children ?? && temps.children.ad?? && temps.children.ad.imgList?? && temps.children.ad.imgList?size &gt; 0>
                                    <a <#if temps.children.ad.imgList[0].href ??>href="${(temps.children.ad.imgList[0].href)!}" target="_blank" </#if> class="loog_img edit-mode" modelId="${(temps.children.ad.modelId)!}" modelType="${(temps.children.ad.modelType)!}" data-code="${(temps.children.ad.modelId)!}">
                                        <img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(temps.children.ad.imgList[0].src)!}" alt="${(temps.children.ad.imgList[0].alt)!}" width="280" height="386"/>
                                    </a>
                                </#if>
                                <div class="loop_gou edit-mode" modelId="${(temps.children.help.modelId)!}" modelType="${(temps.children.help.modelType)!}">
                                    <#if temps.children ?? && temps.children.help?? && temps.children.help.linkList ?? && temps.children.help.linkList?size &gt;0>
                                        <h3>如何买？</h3>
                                        <ul>
                                            <#list temps.children.help.linkList as links>
                                                <li>
                                                    <a <#if links.href ??>href="${(links.href)!}" target="_blank"</#if> class="des" data-code="${(temps.children.help.modelId)!}-${temps_index+1}">${(links.textOtherAttr.elemenlName?split('|')[0])!}</a>
                                                    <a <#if links.href ??>href="${(links.href)!}" target="_blank"</#if> data-code="${(temps.children.help.modelId)!}-${temps_index+1}">${(links.textOtherAttr.elemenlName?split('|')[1])!}</a>
                                                </li>
                                            </#list>
                                        </ul>
                                    </#if>
                                </div>
                            </div>
                            <#if temps.children ?? && temps.children.product?? && temps.children.product.prdList?? && temps.children.product.prdList?size &gt; 0>
                                <div class="loop_right clearfix edit-mode" modelId="${(temps.children.product.modelId)!}" modelType="${(temps.children.product.modelType)!}">
                                    <ul>
                                        <#list temps.children.product.prdList as list>
                                            <li <#if list_index == 0 || list_index == 1 || list_index == 2 || list_index == 3>class="margin_btm"</#if>>
                                                <dl>
                                                    <dt class="good_img">
                                                        <a <#if list.detailHref ??>href="${(list.detailHref)!}" target="_blank"</#if> data-code="${(temps.children.product.modelId)!}-${list_index+1}" title="${(list.name)!}">
                                                            <#if list.manualImg ?? >
                                                                <img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${list.manualImg}" alt="${(list.name)!}" width="130" height="130"/>
                                                            <#else>
                                                                <img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(list.goodsImgs[0].src)!}_130.jpg" alt="${(list.name)!}" width="130" height="130"/>
                                                            </#if>
                                                        </a>
                                                    </dt>
                                                    <dd class="good_name">
                                                        <a <#if list.detailHref ??>href="${(list.detailHref)!}" target="_blank"</#if> data-code="${(temps.children.product.modelId)!}-${list_index+1}" title="${(list.name)!}">${(list.name)!}</a>
                                                    </dd>
                                                    <dd class="good_price" data-target="p-price"  data-skuId="${(list.skuId)!}">¥<i class="minPrice"><@FormatPrice.priceFormat curprice=list.price /></i></dd>
                                                </dl>
                                            </li>
                                        </#list>
                                    </ul>
                                </div>
                            </#if>
                        </div>
                        <#if temps.children ?? && temps.children.logo ?? && temps.children.logo.imgList ?? && temps.children.logo.imgList?size &gt; 0>
                            <div class="brand_logo loop_bottom edit-mode" modelId="${(temps.children.logo.modelId)!}" modelType="${(temps.children.logo.modelType)!}">
                                <#list temps.children.logo.imgList as img>
                                    <a <#if img.href ??>href="${(img.href)!}" target="_blank"</#if> data-code="${(children.new.children.logo.modelId)!}-${img_index+1}"><img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(img.src)!}" alt="" width="150" height="76"/></a>
                                </#list>
                            </div>
                        </#if>
                    </div>
                </div>
            </#list>
        </#if>
    </div>
</div>