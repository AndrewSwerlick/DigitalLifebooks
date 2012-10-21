$(document).ready(function(){
	if($('#add-album').length){
		addAlbum();
	}
});

function addAlbum(){
	$('#add-album').on('click', function(e){
		e.preventDefault();
		$('#add-album-form').dialog({

		});
	});
}