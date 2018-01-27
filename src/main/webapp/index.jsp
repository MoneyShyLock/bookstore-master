<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>用户信息页面 - Bootstrap后台管理系统模版Ace下载</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- basic styles -->

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <!-- page specific plugin styles -->

    <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" href="assets/css/jquery.gritter.css" />
    <link rel="stylesheet" href="assets/css/select2.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-editable.css" />

    <!-- fonts -->

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

    <!-- ace styles -->

    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="assets/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <div class="main-content">


            <div class="page-content">
               <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="hr dotted"></div>

                        <div>
                            <div id="user-profile-1" class="user-profile row">
                                <div class="col-xs-12 col-sm-3 center">
                                    <div>
												<span class="profile-picture">
													<img id="avatar" class="editable img-responsive" alt="Alex's Avatar" src="assets/avatars/profile-pic.jpg" />
												</span>

                                        <div class="space-4"></div>

                                        <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                            <div class="inline position-relative">
                                                <a href="#" class="user-title-label dropdown-toggle" data-toggle="dropdown">
                                                    <i class="icon-circle light-green middle"></i>
                                                    &nbsp;
                                                    <span class="white">${adminInformation.name}</span>
                                                </a>

                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-xs-12 col-sm-9">

                                    <div class="profile-user-info profile-user-info-striped">
                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> 姓名 </div>

                                            <div class="profile-info-value">
                                                <span class="editable" id="username">${adminInformation.name}</span>
                                            </div>
                                        </div>

                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> Location </div>

                                            <div class="profile-info-value">
                                                <i class="icon-map-marker light-orange bigger-110"></i>
                                                <span class="editable" id="country">Netherlands</span>
                                                <span class="editable" id="city">Amsterdam</span>
                                            </div>
                                        </div>

                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> Age </div>

                                            <div class="profile-info-value">
                                                <span class="editable" id="age">38</span>
                                            </div>
                                        </div>

                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> Joined </div>

                                            <div class="profile-info-value">
                                                <span class="editable" id="signup">20/06/2010</span>
                                            </div>
                                        </div>

                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> Last Online </div>

                                            <div class="profile-info-value">
                                                <span class="editable" id="login">3 hours ago</span>
                                            </div>
                                        </div>

                                        <div class="profile-info-row">
                                            <div class="profile-info-name"> About Me </div>

                                            <div class="profile-info-value">
                                                <span class="editable" id="about">Editable as WYSIWYG</span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div><!-- /.main-content -->

        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i>
            </div>

            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; Choose Skin</span>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                    <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                    <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                    <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                    <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                    <label class="lbl" for="ace-settings-add-container">
                        Inside
                        <b>.container</b>
                    </label>
                </div>
            </div>
        </div><!-- /#ace-settings-container -->
    </div><!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="assets/js/excanvas.min.js"></script>
<![endif]-->

<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="assets/js/jquery.gritter.min.js"></script>
<script src="assets/js/bootbox.min.js"></script>
<script src="assets/js/jquery.slimscroll.min.js"></script>
<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="assets/js/jquery.hotkeys.min.js"></script>
<script src="assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="assets/js/select2.min.js"></script>
<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="assets/js/fuelux/fuelux.spinner.min.js"></script>
<script src="assets/js/x-editable/bootstrap-editable.min.js"></script>
<script src="assets/js/x-editable/ace-editable.min.js"></script>
<script src="assets/js/jquery.maskedinput.min.js"></script>

<!-- ace scripts -->

<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
    jQuery(function($) {

        //editables on first profile page
        $.fn.editable.defaults.mode = 'inline';
        $.fn.editableform.loading = "<div class='editableform-loading'><i class='light-blue icon-2x icon-spinner icon-spin'></i></div>";
        $.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit"><i class="icon-ok icon-white"></i></button>'+
                '<button type="button" class="btn editable-cancel"><i class="icon-remove"></i></button>';

        //editables
        $('#username').editable({
            type: 'text',
            name: 'username'
        });


        var countries = [];
        $.each({ "CA": "Canada", "IN": "India", "NL": "Netherlands", "TR": "Turkey", "US": "United States"}, function(k, v) {
            countries.push({id: k, text: v});
        });

        var cities = [];
        cities["CA"] = [];
        $.each(["Toronto", "Ottawa", "Calgary", "Vancouver"] , function(k, v){
            cities["CA"].push({id: v, text: v});
        });
        cities["IN"] = [];
        $.each(["Delhi", "Mumbai", "Bangalore"] , function(k, v){
            cities["IN"].push({id: v, text: v});
        });
        cities["NL"] = [];
        $.each(["Amsterdam", "Rotterdam", "The Hague"] , function(k, v){
            cities["NL"].push({id: v, text: v});
        });
        cities["TR"] = [];
        $.each(["Ankara", "Istanbul", "Izmir"] , function(k, v){
            cities["TR"].push({id: v, text: v});
        });
        cities["US"] = [];
        $.each(["New York", "Miami", "Los Angeles", "Chicago", "Wysconsin"] , function(k, v){
            cities["US"].push({id: v, text: v});
        });

        var currentValue = "NL";
        $('#country').editable({
            type: 'select2',
            value : 'NL',
            source: countries,
            success: function(response, newValue) {
                if(currentValue == newValue) return;
                currentValue = newValue;

                var new_source = (!newValue || newValue == "") ? [] : cities[newValue];

                //the destroy method is causing errors in x-editable v1.4.6
                //it worked fine in v1.4.5
                /**
                 $('#city').editable('destroy').editable({
							type: 'select2',
							source: new_source
						}).editable('setValue', null);
                 */

                //so we remove it altogether and create a new element
                var city = $('#city').removeAttr('id').get(0);
                $(city).clone().attr('id', 'city').text('Select City').editable({
                    type: 'select2',
                    value : null,
                    source: new_source
                }).insertAfter(city);//insert it after previous instance
                $(city).remove();//remove previous instance

            }
        });

        $('#city').editable({
            type: 'select2',
            value : 'Amsterdam',
            source: cities[currentValue]
        });



        $('#signup').editable({
            type: 'date',
            format: 'yyyy-mm-dd',
            viewformat: 'dd/mm/yyyy',
            datepicker: {
                weekStart: 1
            }
        });

        $('#age').editable({
            type: 'spinner',
            name : 'age',
            spinner : {
                min : 16, max:99, step:1
            }
        });

        //var $range = document.createElement("INPUT");
        //$range.type = 'range';
        $('#login').editable({
            type: 'slider',//$range.type == 'range' ? 'range' : 'slider',
            name : 'login',
            slider : {
                min : 1, max:50, width:100
            },
            success: function(response, newValue) {
                if(parseInt(newValue) == 1)
                    $(this).html(newValue + " hour ago");
                else $(this).html(newValue + " hours ago");
            }
        });

        $('#about').editable({
            mode: 'inline',
            type: 'wysiwyg',
            name : 'about',
            wysiwyg : {
                //css : {'max-width':'300px'}
            },
            success: function(response, newValue) {
            }
        });



        // *** editable avatar *** //
        try {//ie8 throws some harmless exception, so let's catch it

            //it seems that editable plugin calls appendChild, and as Image doesn't have it, it causes errors on IE at unpredicted points
            //so let's have a fake appendChild for it!
            if( /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ) Image.prototype.appendChild = function(el){}

            var last_gritter
            $('#avatar').editable({
                type: 'image',
                name: 'avatar',
                value: null,
                image: {
                    //specify ace file input plugin's options here
                    btn_choose: 'Change Avatar',
                    droppable: true,
                    /**
                     //this will override the default before_change that only accepts image files
                     before_change: function(files, dropped) {
								return true;
							},
                     */

                    //and a few extra ones here
                    name: 'avatar',//put the field name here as well, will be used inside the custom plugin
                    max_size: 110000,//~100Kb
                    on_error : function(code) {//on_error function will be called when the selected file has a problem
                        if(last_gritter) $.gritter.remove(last_gritter);
                        if(code == 1) {//file format error
                            last_gritter = $.gritter.add({
                                title: 'File is not an image!',
                                text: 'Please choose a jpg|gif|png image!',
                                class_name: 'gritter-error gritter-center'
                            });
                        } else if(code == 2) {//file size rror
                            last_gritter = $.gritter.add({
                                title: 'File too big!',
                                text: 'Image size should not exceed 100Kb!',
                                class_name: 'gritter-error gritter-center'
                            });
                        }
                        else {//other error
                        }
                    },
                    on_success : function() {
                        $.gritter.removeAll();
                    }
                },
                url: function(params) {
                    // ***UPDATE AVATAR HERE*** //
                    //You can replace the contents of this function with examples/profile-avatar-update.js for actual upload


                    var deferred = new $.Deferred

                    //if value is empty, means no valid files were selected
                    //but it may still be submitted by the plugin, because "" (empty string) is different from previous non-empty value whatever it was
                    //so we return just here to prevent problems
                    var value = $('#avatar').next().find('input[type=hidden]:eq(0)').val();
                    if(!value || value.length == 0) {
                        deferred.resolve();
                        return deferred.promise();
                    }


                    //dummy upload
                    setTimeout(function(){
                        if("FileReader" in window) {
                            //for browsers that have a thumbnail of selected image
                            var thumb = $('#avatar').next().find('img').data('thumb');
                            if(thumb) $('#avatar').get(0).src = thumb;
                        }

                        deferred.resolve({'status':'OK'});

                        if(last_gritter) $.gritter.remove(last_gritter);
                        last_gritter = $.gritter.add({
                            title: 'Avatar Updated!',
                            text: 'Uploading to server can be easily implemented. A working example is included with the template.',
                            class_name: 'gritter-info gritter-center'
                        });

                    } , parseInt(Math.random() * 800 + 800))

                    return deferred.promise();
                },

                success: function(response, newValue) {
                }
            })
        }catch(e) {}



        //another option is using modals
        $('#avatar2').on('click', function(){
            var modal =
                    '<div class="modal hide fade">\
                        <div class="modal-header">\
                            <button type="button" class="close" data-dismiss="modal">&times;</button>\
                            <h4 class="blue">Change Avatar</h4>\
                        </div>\
                        \
                        <form class="no-margin">\
                        <div class="modal-body">\
                            <div class="space-4"></div>\
                            <div style="width:75%;margin-left:12%;"><input type="file" name="file-input" /></div>\
                        </div>\
                        \
                        <div class="modal-footer center">\
                            <button type="submit" class="btn btn-small btn-success"><i class="icon-ok"></i> Submit</button>\
                            <button type="button" class="btn btn-small" data-dismiss="modal"><i class="icon-remove"></i> Cancel</button>\
                        </div>\
                        </form>\
                    </div>';


            var modal = $(modal);
            modal.modal("show").on("hidden", function(){
                modal.remove();
            });

            var working = false;

            var form = modal.find('form:eq(0)');
            var file = form.find('input[type=file]').eq(0);
            file.ace_file_input({
                style:'well',
                btn_choose:'Click to choose new avatar',
                btn_change:null,
                no_icon:'icon-picture',
                thumbnail:'small',
                before_remove: function() {
                    //don't remove/reset files while being uploaded
                    return !working;
                },
                before_change: function(files, dropped) {
                    var file = files[0];
                    if(typeof file === "string") {
                        //file is just a file name here (in browsers that don't support FileReader API)
                        if(! (/\.(jpe?g|png|gif)$/i).test(file) ) return false;
                    }
                    else {//file is a File object
                        var type = $.trim(file.type);
                        if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif)$/i).test(type) )
                                || ( type.length == 0 && ! (/\.(jpe?g|png|gif)$/i).test(file.name) )//for android default browser!
                        ) return false;

                        if( file.size > 110000 ) {//~100Kb
                            return false;
                        }
                    }

                    return true;
                }
            });

            form.on('submit', function(){
                if(!file.data('ace_input_files')) return false;

                file.ace_file_input('disable');
                form.find('button').attr('disabled', 'disabled');
                form.find('.modal-body').append("<div class='center'><i class='icon-spinner icon-spin bigger-150 orange'></i></div>");

                var deferred = new $.Deferred;
                working = true;
                deferred.done(function() {
                    form.find('button').removeAttr('disabled');
                    form.find('input[type=file]').ace_file_input('enable');
                    form.find('.modal-body > :last-child').remove();

                    modal.modal("hide");

                    var thumb = file.next().find('img').data('thumb');
                    if(thumb) $('#avatar2').get(0).src = thumb;

                    working = false;
                });


                setTimeout(function(){
                    deferred.resolve();
                } , parseInt(Math.random() * 800 + 800));

                return false;
            });

        });



        //////////////////////////////
        $('#profile-feed-1').slimScroll({
            height: '250px',
            alwaysVisible : true
        });

        $('.profile-social-links > a').tooltip();

        $('.easy-pie-chart.percentage').each(function(){
            var barColor = $(this).data('color') || '#555';
            var trackColor = '#E2E2E2';
            var size = parseInt($(this).data('size')) || 72;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate:false,
                size: size
            }).css('color', barColor);
        });

        ///////////////////////////////////////////

        //show the user info on right or left depending on its position
        $('#user-profile-2 .memberdiv').on('mouseenter', function(){
            var $this = $(this);
            var $parent = $this.closest('.tab-pane');

            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $this.offset();
            var w2 = $this.width();

            var place = 'left';
            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) place = 'right';

            $this.find('.popover').removeClass('right left').addClass(place);
        }).on('click', function() {
            return false;
        });


        ///////////////////////////////////////////
        $('#user-profile-3')
                .find('input[type=file]').ace_file_input({
                    style:'well',
                    btn_choose:'Change avatar',
                    btn_change:null,
                    no_icon:'icon-picture',
                    thumbnail:'large',
                    droppable:true,
                    before_change: function(files, dropped) {
                        var file = files[0];
                        if(typeof file === "string") {//files is just a file name here (in browsers that don't support FileReader API)
                            if(! (/\.(jpe?g|png|gif)$/i).test(file) ) return false;
                        }
                        else {//file is a File object
                            var type = $.trim(file.type);
                            if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif)$/i).test(type) )
                                    || ( type.length == 0 && ! (/\.(jpe?g|png|gif)$/i).test(file.name) )//for android default browser!
                            ) return false;

                            if( file.size > 110000 ) {//~100Kb
                                return false;
                            }
                        }

                        return true;
                    }
                })
                .end().find('button[type=reset]').on(ace.click_event, function(){
                    $('#user-profile-3 input[type=file]').ace_file_input('reset_input');
                })
                .end().find('.date-picker').datepicker().next().on(ace.click_event, function(){
            $(this).prev().focus();
        })
        $('.input-mask-phone').mask('(999) 999-9999');

        //change profile
        $('[data-toggle="buttons"] .btn').on('click', function(e){
            var target = $(this).find('input[type=radio]');
            var which = parseInt(target.val());
            $('.user-profile').parent().addClass('hide');
            $('#user-profile-'+which).parent().removeClass('hide');
        });
    });
</script>

</body>
</html>
