/*@Author ThuanNH*/
var onepay = function() {
	
	//public functions
	return {
		setSelectBoxValue: function(selectBoxId, selectBoxDataId, value) {
			var selectedIndex = $(selectBoxId + ' option[value='+value+']').index();
			if(selectedIndex < 0) selectedIndex = 0;
			$('li[rel='+selectedIndex+'] a', $('button[data-id='+selectBoxDataId+']').parent()).click();
		},
	
		ckeditor: function() {
			//update ckeditor to element
			for(var instanceName in CKEDITOR.instances) {
                CKEDITOR.instances[instanceName].updateElement();
            }
		}
		
	};
}();

$.fn.wrapInTag = function(opts) {

  var tag = opts.tag || 'strong'
    , words = opts.words || []
    , regex = RegExp(words.join('|'), 'gi') // case insensitive
    , replacement = '<'+ tag +'>$&</'+ tag +'>';

  return this.html(function() {
    return $(this).text().replace(regex, replacement);
  });
};
