$(function() {
	var addDiv = $('#addNewTime');
	var i = $('#addNewTime p').size() + 1;

	 $('#addNew').on('click', function() {
                if(i<=4){
                        $('<p><input type="time" name="time1' + i +'" value="" placeholder="Enter Another Option!"><a href="#" class="remNew">Remove</a> </p>').appendTo(addDiv);
                        i++;
                // return false;
                        $('.remNew').on('click', function() { 
                                $(this).parents('p').remove();
                                i--;
                                return false;
                        });
                };
                return false;
        });

});

// $(element).next().show()
// 
// 
// $(function() {
//         var addDiv = $('#addNewTime');
//         var i = $('#addNewTime p').size() + 1;
//         
//         $('#addNew').on('click', function() {
//                 if(i<=4){
//                         $('<p><input type="time" name="time1' + i +'" value="" placeholder="Enter Another Time!"><a href="#" class="remNew">Remove</a> </p>').appendTo(addDiv);
//                         i++;
// 
//                         $('.remNew').on('click', function() { 
//                                 $(this).parents('p').remove();
//                                 i--;
//                                 return false;
//                         });
//                 };
//                 return false;
//         });
// });