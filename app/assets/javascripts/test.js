$(function() {
        var addDiv = $('#field');
        var i = $('#field p').size() + 1;
        
        $('#addNew2').on('click', function() {
                if(i<=4){
                    //  can i have it add ruby... f.label... 
 						$('<p><input type="text" name="loc' + i +'" value="" placeholder="Enter Another thingy!"><a href="#" class="remNew">Remove</a> </p>').appendTo(addDiv);
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

$():onclick => "field hidden-input.hide();return false"


$('.hidden-input').show();
{
<div class=​"field hidden-input" style>​…​</div>​
};