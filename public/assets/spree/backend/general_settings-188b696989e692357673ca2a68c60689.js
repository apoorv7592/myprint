(function(){$(this).ready(function(){return $("[data-hook=general_settings_clear_cache] #clear_cache").click(function(){return $.ajax({type:"POST",url:"/admin/general_settings/clear_cache",success:function(){return show_flash("success","Cache was flushed.")},error:function(e){return e.responseJSON.error?show_flash("error",e.responseJSON.error):show_flash("error","There was a problem while flushing cache.")}})})})}).call(this);