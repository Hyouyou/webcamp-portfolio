$(function(){
	$(document).on('turbolinks:load', () => {
		$('#open-modal1').click(function(){
			$('#modal-area1').fadeIn();
		});
		$('#close-modal1').click(function(){
			$('#modal-area1').fadeOut();
		});

		$('#open-modal2').click(function(){
			$('#modal-area2').fadeIn();
		});
		$('#close-modal2').click(function(){
			$('#modal-area2').fadeOut();
		});

		$('#open-modal3').click(function(){
			$('#modal-area3').fadeIn();
		});
		$('#close-modal3').click(function(){
			$('#modal-area3').fadeOut();
		});
	});
});