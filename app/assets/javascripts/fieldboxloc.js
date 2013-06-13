$(function() {
  // var addDiv = $('.addNewLoc');
  // var i = $('.addNewLoc p').size() + 1;
  
  // $('#addNew').on('click', function() {
  //   if(i<=4){
  //       $('<p><input type="text" name="loc' + i +'" value="" placeholder="Enter Another thingy!"><a href="#" class="remNew">Remove</a></p>').appendTo(addDiv);
  //     i++;

  //     $('.remNew').on('click', function() { 
  //       $(this).parents('p').remove();
  //       i--;
  //       return false;
  //     });
  //   };
  //   return false;
  // });


$('.addNew').on('click', function(){
  $(this).parent().next('p').removeClass('hide');
  return false;
});


$('.rem').on('click', function(){
  // $(this).parent('p').remove();
  $(this).parent('p').addClass('hide');
  $(this).parent('p').children('input').val('');
  return false;
});

$('.addNewTime').on('click', function(){
  $(this).parent().next('div').removeClass('hide');
  return false;
});


$('.remTime').on('click', function(){
  // $(this).parent('div').remove();
  $(this).parent('div').addClass('hide');
  $(this).parent('div').children('select').val('hour');
  return false;
});

});