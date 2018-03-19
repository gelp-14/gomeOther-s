<#if children.cat ?? && children.cat.catList ?? && children.cat.catList?size &gt; 0>
    <div class="search wbox">
        <div class="newgood_top">
            <h2 class="edit-mode" modelId="${(children.cat.modelId)!}" modelType="${(children.cat.modelType)!}"><span class="line"></span><span class="floor_name">${(children.cat.modelName)!}</span></h2>
        </div>
        <div class="search_box clearfix">
            <span class="commodity">商品分类：</span>
            <div class="commodity_select" id="commodity">
                <p>请选择商品</p>
                <i></i>
                <ul>
                    <#list children.cat.catList as cat>
                        <li data-categoryId ="${(cat.textOtherAttr.categoryId)!}">${(cat.text)!}</li>
                    </#list>
                </ul>
            </div>
            <span class="parts">配件分类：</span>
            <div class="parts_select" id="parts">
                <p>请选择商品</p>
                <i></i>
                <ul>
                </ul>
            </div>
            <a class="botton" id="botton">查询</a>
        </div>
    </div>
</#if>
<script id="catId" type="text/html">
    {{each data as value i}}
    <li data-cart="{{value.categoryId}}">
        {{value.categoryName}}
    </li>
    {{/each}}
</script>