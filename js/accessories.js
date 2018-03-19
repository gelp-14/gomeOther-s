seajs.config({base:stageJsServer});
seajs.use(['gmlib/ui/gload/1.0.0/gload.min.js','gmlib/ui/getajaxprice/1.0.0/getajaxprice.min.js','/js/slider','/js/unit','/js/easing','/js/fixable','/js/smartkey','/js/elevator','/js/ele_start','/js/lazyload'],function(){
    window.setTimeout(function () {
        var editMarks = $("#editModeId").attr("editMark");
        if (editMarks == 1) { //可视化编辑
            seajs.use(['gmlib/unit/gedit/1.0.0/dialogs',
                    'gmlib/unit/gedit/1.0.0/editmode',
                    'gmlib/unit/gedit/1.0.0/editmodule'
                ], function () {
                    editMode.init();
                }
            );
        }
        seajs.use(['gmlib/unit/scode/1.0.0/scode.min.js','gmlib/unit/bigdata/1.0.0/bigdata.min.js','gmlib/unit/scodecommon/1.0.0/scodecommon.min.js'],function(){
            s.pageName="精品配件:首页";
            s.channel="精品配件";
            s.prop1="精品配件:首页";
            s.prop2="精品配件:首页";
            s.prop3="精品配件:首页";
            s.prop4="精品配件";
            var s_code=s.t();
            if (s_code) {
                document.write(s_code);
            }

        })
    }, 2000);
    ;(function($){
        var accessories = function(){
            this.init();
        };
        accessories.prototype={
            init:function() {
                this.bxLogo();
                this.slide(); //焦点图
                this.search();//配件小助手
                this.getPrice(); //价格异步
                this.getImg(); //图片懒加载
                this.like(); //猜你喜欢

            },
            bxLogo:function(){
                $('#logo').append('<div class="peijian"></div>');
                $('#logo').append('<h1 style="display:none">配件-国美</h1>');
                $("#logo-gif").css("display","none");
            },
            slide:function(){  //焦点图
                $('.slideBox').mySlider({
                    'content': '.slideBox',
                    'item': '.bd li',
                    'prev':'.prev',
                    'next':'.next',
                    'nav':'.hd li',
                    'cur':'on',
                    'auto':true,
                    'tab':true
                });
            },
            search:function(){
                $(document).bind('click', function(e) {
                    var e = e || window.event; //浏览器兼容性
                    var elem = e.target || e.srcElement;
                    while (elem) { //循环判断至跟节点，防止点击的是div子元素
                        if ((elem.id && elem.id == 'commodity') ||(elem.id && elem.id=="parts") || (elem.id && elem.id =="botton")) {
                            return;
                        }
                        elem = elem.parentNode;
                    }
                    $(".commodity_select ul").hide(); //点击的不是div或其子元素
                    $(".parts_select ul").hide(); //点击的不是div或其子元素
                });
                //商品分类选择
                $(".commodity_select p").click(function(){
                    var ul = $(".commodity_select ul");
                    if(ul.css("display")=="none"){
                        ul.slideDown("fast");
                    }else{
                        ul.slideUp("fast");
                    }
                });
                //没有做接口缓存
                $(".commodity_select ul li").click(function(){
                    var txt = $(this).text();
                    var catid = $(this).attr("data-categoryid");
                    $(".commodity_select p").html(txt);
                    var cat = $(".commodity_select p").attr("cat",catid);
                    $(".commodity_select ul").hide();
                    parts_select(catid);
                });
                //配件分类选择
                $(".parts_select p").click(function(){
                    var ul = $(".parts_select ul");
                    if(ul.css("display")=="none" && ul.children('li').length >0){
                        ul.slideDown("fast");
                    }else{
                        ul.slideUp("fast");
                    }
                });
                //二级联动
                function parts_select(cat){
                    $.ajax({
                        type: "get",
                        url: "//ss"+cookieDomain+"/item/v1/channel/category/getCategory/"+cat+"/flag/channel/shai",
                        cache: false,
                        dataType: "jsonp",
                        jsonpName: "shai",
                        success: function (data) {
                           if(data && data.dto.length >0 && data.dto[0] != null){
                               var html = templateSimple('catId', {data:data.dto});
                               $('.parts_select ul').html(html);
                               $(".parts_select ul li").click(function(){
                                   var txt = $(this).text();
                                   var catid = $(this).attr("data-cart");
                                   $(".parts_select p").html(txt);
                                   $(".parts_select p").attr("cat",catid);
                                   //点击查询
                                   $('.parts_select').next('a').attr('href','//list'+cookieDomain+'/'+catid+'.html').attr('target','_blank');
                                   $(".parts_select ul").hide();


                               });
                           }else{
                               $(".parts_select p").html('请选择商品');
                               $(".parts_select ul li").remove();
                               $('.parts_select').next('a').removeAttr('href').removeAttr('target');
                           }
                        }
                    });
                }
            },
            getPrice:function(){//价格异步
                $(".newGood,.brandNew,.loop_right,.floor_loop").getAjaxPrice();
            },
            getImg:function(){
                $(".focus_banner,.brandNew,.brand_logo,.floor_loop,.newGood,.salesGood_wrap").lazyload({
                    source: "data-lazy-img"
                });
            },
            like:function(){
                $('#elevator ul:first li').last().hide();
                var dataJson = {
                    boxid:"box68", //展位ID 固定
                    pid:"",
                    area:$.cookie('atgregion') ? $.cookie('atgregion').split("|")[0] : "11011400", //用户所在地区ID
                    cid:$.cookie("__clickidc"),//cookieID
                    currentpage:1,
                    uid:"",
                    imagesize:"140", //商品图片大小
                    c1n:"",
                    c3n:"",
                    brid:"",
                    shopid:"",
                    c3id:"",
                    c2id:"",
                    sid:"",
                    pagingid:""
                };
                var pagingid,totalPage;
                $('.like .wbox').hide();
                $('.like1').gLoad({
                    e:function(){
                        ajaxBig(dataJson,1);
                    }
                });
                var tur = true;
                $(window).scroll(function(){
                    var scrollTop = $(this).scrollTop();
                    var scrollHeight = $(document).height();
                    var windowHeight = $(this).height();
                    if ((scrollTop + windowHeight >= scrollHeight-200) && pagingid) {
                        dataJson.pagingid = pagingid;
                        if((dataJson.currentpage<=totalPage) && tur){
                           var i = dataJson.currentpage;
                            tur = false;
                            setTimeout(ajaxBig(dataJson,i),1000);
                        }
                    }
                });
                function ajaxBig(dataJson,cls){
                    $.ajax({
                        type: "get",
                        url: "//bigd"+gomeplusDomain+"/gome/rec",
                        data:dataJson,
                        cache: false,
                        dataType: "jsonp",
                        jsonpName: "bigd"+(parseInt(Math.random(802547) *100000)),
                        success: function (data) {
                            if(data && data.lst.length > 0){
                                tur = true;
                                pagingid = data.pagingid;
                                totalPage = data.totalPage;
                                dataJson.currentpage++;
                                var html = templateSimple('like', {data:data.lst});
                                $('.like'+cls).html(html);
                                $('#elevator ul:first li').last().show();
                                $('.like .wbox').show();
                            }
                        }
                    })
                }

            }
        };
        new accessories();
    })(jQuery)
});