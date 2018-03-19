<div class="like">
    <div class="wbox floor"  data-title="猜你喜欢">
        <div class="newgood_top">
            <h2><span class="line"></span><span class="floor_name">猜你喜欢</span></h2>
        </div>
        <ul class="like1"></ul>
        <ul class="like2"></ul>
        <ul class="like3"></ul>
    </div>
</div>
<script id="like" type="text/html">
    {{each data as value i}}
        <li>
            <dl>
                <dt class="good_img">
                    <a href="{{value.purl}}" target="_blank" title="{{value.pn}}">
                        <img src="{{value.iurl}}" alt="{{value.pn}}" width="140" height="140"/>
                    </a>
                </dt>
                <dd class="good_name">
                    <a href="{{value.purl}}" target="_blank">{{value.pn}}</a>
                </dd>
                <dd class="good_price">¥<i class="minPrice">{{value.price}}</i></dd>
            </dl>
        </li>
    {{/each}}
</script>