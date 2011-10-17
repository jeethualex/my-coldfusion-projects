// JavaScript Document

if (!String.prototype.removeListItem) {
   String.prototype.removeListItem = function(value, delimiter) {
      delimiter = delimiter || ',';
      value = value.toString();
      var arr = this.split(delimiter),
         index = arr.indexOf(value);
      while (index >= 0) {
         arr.splice(index, 1);
         index = arr.indexOf(value);
      }
      return arr.join(delimiter);
   };
}


function removeFile(photo,idx){
	
	var removeLst = $('.removePhotos').val();
	var oldPhotoLst = $('.oldPhotos').val().removeListItem(photo);
	$('.oldPhotos').val(oldPhotoLst); 
	$("."+idx).toggleClass('hide');
	
	if(removeLst == '') removeLst =  photo;
	else removeLst =  removeLst+","+photo;
	
	$('.removePhotos').val(removeLst);
}