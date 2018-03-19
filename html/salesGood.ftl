<#if children.lowPrice ?? && children.lowPrice.imgList ?? && children.lowPrice.imgList?size &gt;0>
    <div class="salesGood">
        <div class="newgood_top salesGood_top wbox">
            <h2 class="edit-mode" modelId="${(children.lowPrice.modelId)!}" modelType="${(children.lowPrice.modelType)!}"><span class="line"></span><span class="floor_name">${(children.lowPrice.modelName)!}</span></h2>
        </div>
        <div class="salesGood_wrap edit-mode" modelId="${(children.lowPrice.modelId)!}" modelType="${(children.lowPrice.modelType)!}" >
            <div class="salesGood_wrap_bg"></div>
            <div class="wbox">
                <#list children.lowPrice.imgList as img>
                    <a <#if img.href ??>href="${(img.href)!}" target="_blank"</#if> class="sale${img_index+1}" data-code="${(children.lowPrice.modelId)!}-${img_index+1}"><img src="${(gomeImgLoad)!}" data-lazy-img="0" data-lazy-init="${(img.src)!}" alt=""/></a>
                </#list>
            </div>
        </div>
    </div>
</#if>
