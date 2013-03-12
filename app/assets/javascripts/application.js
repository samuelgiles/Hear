// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function resort(){
	var iCount = 1;
	$(".album", ".albums.owned").each(function(){
		$(".position", this).html(iCount);
		iCount++;
	});
}

$(document).ready(function(){

	if($("body").attr("data-background") != ""){
			
		$.backstretch($("body").attr("data-background"));

	}
	$(".albums.owned .remove").click(function(event){
		var oAlbum = $(this);
		event.preventDefault();
		$.ajax({
			type: 'post',
			data: {id: (($(this).closest(".album").attr("id")).replace("album_", ""))},
			dataType: 'script',
			complete: function(request){
				if(request.status == 200){
					$(oAlbum).closest(".album").slideUp(200, function(){ $(this).remove(); resort(); });
					$('.albums.owned').effect('highlight');
				}
				else{
					alert("An error occured whilst removing an album.")
				}
				
			},
			url: '/albums/remove'
		})
		return false;
	});
	
	$(".albums .album-listen").click(function(event){
		var oAlbum = $(this);
		event.preventDefault();
		
		if($(this).hasClass("listened_false")){

			$.ajax({
				type: 'post',
				data: {id: (($(this).closest(".album").attr("id")).replace("album_", ""))},
				dataType: 'script',
				complete: function(request){
					if(request.status == 200){
						$('.albums.owned').effect('highlight');
						$(oAlbum).removeClass("listened_false").addClass("listened_true")
					}
					else{
						alert("An occured whilst marking an album as listened")
					}
					
				},
				url: '/albums/listen'
			})

		}
		else{
			
			$.ajax({
				type: 'post',
				data: {id: (($(this).closest(".album").attr("id")).replace("album_", ""))},
				dataType: 'script',
				complete: function(request){
					if(request.status == 200){
						$('.albums.owned').effect('highlight');
						$(oAlbum).removeClass("listened_true").addClass("listened_false")
					}
					else{
						alert("An occured whilst marking an album as unlistened")
					}
					
				},
				url: '/albums/unlisten'
			})

		}
		return false;
	});

	$('.albums.owned').sortable({
		axis: 'y',
		dropOnEmpty: false,
		handle: '.position',
		cursor: 'crosshair',
		items: 'li',
		opacity: 0.4,
		scroll: true,
		update: function(){
		$.ajax({
		type: 'post',
		data: $('.albums.owned').sortable('serialize'),
		dataType: 'script',
		complete: function(request){
			if(request.status == 200){
				$('.albums.owned').effect('highlight');
			}
			else{
				alert("An error occured whilst sorting albums.")
			}
			resort();
		},
		url: '/albums/sort'})
		}
	});


});
