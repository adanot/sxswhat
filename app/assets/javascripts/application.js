// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap
//= require turbolinks
//= require datepicker
//= require fullcalendar
//= require bootstrap-timepicker
//= require_tree .

$("document").ready(function(){
 var nowTemp = new Date();
  
  var startDate = new Date(2014, 2 , 07, 0, 0, 0, 0);
  var endDate = new Date(2014, 2 , 16, 0, 0, 0, 0);
  $(".datepicker").datepicker({
    onRender: function(date) {
      if( date.valueOf() < startDate.valueOf() || date.valueOf() > endDate.valueOf() ){
        return 'disabled' ;
      }else{
        return "" ;
      }
    }
  });

  $("#free_price, #rsvp, #paid, #free_drink").on('change',function(){
    $(".all").hide();
    if( $("#free_price").is(":checked") ){
      $(".free").show();
    }else{
      $(".free").hide();
    }

    if( $("#rsvp").is(":checked") ){
      $(".rsvp").show();
    }else{
      $(".rsvp").hide();
    }

    if( $("#paid").is(":checked") ){
      $(".paid").show();
    }else{
      $(".paid").hide();
    }

    if( $("#free_drink").is(":checked") ){
      $(".drink").show();
    }else{
      $(".drink").hide();
    }
    if( !$("#free_price").is(":checked") && !$("#rsvp").is(":checked") && !$("#paid").is(":checked") && !$("#free_drink").is(":checked") ){
      $(".all").show();
    }
    $("#event_date").trigger( "change" );
    
    $(".all_date").each(function(){
      if( $(this).find('tr.all:visible').length == 0 ){
        $(this).hide();
      }
    });
  });

  $("#event_date").on('change',function(){
    $(".all_date").hide();
    $("." + $("#event_date").val()).show();
  });
});
