//= require active_admin/base
//= require select2

(function($){
  $(document).ready(function(){
    $("select[multiple]").select2();
  });
})(jQuery);