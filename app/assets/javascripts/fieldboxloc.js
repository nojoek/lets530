$(function() {
  var addDiv = $('.addNewLoc');
  var i = $('.addNewLoc p').size() + 1;
  
  $('#addNew').on('click', function() {
    if(i<=4){
        $('<p><input type="text" name="loc' + i +'" value="" placeholder="Enter Another thingy!"><a href="#" class="remNew">Remove</a></p>').appendTo(addDiv);
      i++;

      $('.remNew').on('click', function() { 
        $(this).parents('p').remove();
        i--;
        return false;
      });
    };
    return false;
  });


$('.addNew').on('click', function(){
  $(this).parent().next('p').removeClass('hide')
  return false;
});

$('.addNew').on('click', function(){
  $(this).parent().next('p').next('input').attr('disabled', ' ')
})

$('.rem').on('click', function(){
  $(this).parent('p').addClass('hide')
  return false;
});




});