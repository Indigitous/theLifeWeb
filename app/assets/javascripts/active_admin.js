//= require active_admin/base
//= require select2
//= require jquery.ui.all

(function($){
  $(document).ready(function(){
    $("select[multiple]").select2();
  });
})(jQuery);