<#if children.chaopin ?? && children.chaopin.children ??>
<div class="newGood">
    <div class="wbox">
            <div class="newgood_top salesGood_top">
                <h2 class="edit-mode" modelId="${(children.chaopin.modelId)!}" modelType="${(children.chaopin.modelType)!}"><span class="line"></span><span class="floor_name">${(children.chaopin.modelName)!}</span><img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(children.chaopin.children.small.imgList[0].src)!}" alt="" height="15"/></h2>
                <#if children.chaopin.children.hot ?? && children.chaopin.children.hot.linkList ?? && children.chaopin.children.hot.linkList?size &gt; 0>
                    <div class="more edit-mode" modelId="${(children.chaopin.children.hot.modelId)!}" modelType="${(children.chaopin.children.hot.modelType)!}">大家都在看：
                        <#list children.chaopin.children.hot.linkList as link>
                            <a <#if link.href ??>href="${(link.href)!}" target="_blank"</#if> data-code="${(children.chaopin.children.hot.modelId)!}-${link_index+1}" <#if !link_has_next>class="last"</#if>>${(link.textOtherAttr.elemenlName)!}</a>
                        </#list>
                    </div>
                </#if>
            </div>
            <#if children.chaopin.children.product ?? && children.chaopin.children.product.prdList?? && children.chaopin.children.product.prdList?size &gt;0>
                <ul class="edit-mode" modelId="${(children.chaopin.children.product.modelId)!}" modelType="${(children.chaopin.children.product.modelType)!}">
                    <#list children.chaopin.children.product.prdList as prd>
                        <li <#if prd_index == 1>class="two"</#if> >
                            <dl>
                                <dt class="good_img">
                                    <a <#if prd.detailHref ?? >href="${(prd.detailHref)!}" target="_blank"</#if> title="${(prd.name)!}" data-code="${(children.chaopin.children.product.modelId)!}-${prd_index+1}">
                                        <#if prd.manualImg ?? >
                                            <img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${prd.manualImg}" alt="${(prd.name)!}" width="315" height="230"/>
                                        <#else>
                                            <img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(prd.goodsImgs[0].src)!}_260.jpg" alt="${(prd.name)!}" width="315" height="230"/>
                                        </#if>
                                    </a>
                                </dt>
                                <dd class="good_name">
                                    <a <#if prd.detailHref ?? >href="${(prd.detailHref)!}" target="_blank"</#if> title="${(prd.name)!}" data-code="${(children.chaopin.children.product.modelId)!}-${prd_index+1}">${(prd.name)!}</a>
                                </dd>
                                <dd class="good_price" data-target="p-price"  data-skuId="${(prd.skuId)!}">¥<i class="minPrice"><@FormatPrice.priceFormat curprice=prd.price /></i></dd>
                                <#if prd.salesPromotionTitle ??>
                                    <dd class="good_label">
                                        <#list prd.salesPromotionTitle?split('|') as title>
                                            <span>${(title)!}</span>
                                        </#list>
                                    </dd>
                                </#if>
                            </dl>
                        </li>
                    </#list>
                </ul>
            </#if>
    </div>
</div>
</#if>