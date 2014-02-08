// Shorthand for $(document).ready();
$(function(){

  var num_frames = $(".frames li").length;
  var frame_width_req = num_frames * 100;
  $(".frames").css("width",frame_width_req+"%");
  $(".frames li").css("width",100/num_frames + "%");

  var frame_chg_amt = parseInt($(".carousel").css("width"));
  $('.frames li:first').before($('.frames li:last'));
  var new_position = frame_chg_amt * -1;
  $(".frames").css("left", new_position + "px");




  $("#previous_frame").click(function(e){
    if ($(".frames").css("left")==="auto"){
      $(".frames").css("left","0%");
    }
    var current_position = parseInt($(".frames").css("left"));
    var new_position = current_position + frame_chg_amt;
    
    $(".frames").animate({left: new_position + "px"}, 500, function(){
      $('.frames li:first').before($('.frames li:last'));
      var new_position = frame_chg_amt * -1;
      $(".frames").css("left", new_position + "px");
    });
    
  });


  $("#next_frame").click(function(e){
    if ($(".frames").css("left")==="auto"){
      $(".frames").css("left","0%");
    }

    var current_position = parseInt($(".frames").css("left"));
    var new_position = current_position - frame_chg_amt;
    
    $(".frames").animate({left: new_position + "px"}, 500, function(){
      $('.frames li:last').after($('.frames li:first'));
      var new_position = frame_chg_amt * -1;
      $(".frames").css("left", new_position + "px");
    });
  });

});