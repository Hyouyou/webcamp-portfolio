// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require refile
//= require jquery
//= require turbolinks
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .

$(document).on('turbolinks:load', function(){

    //$('form input:file').uploadThumbs();

	//fileを選択した時に発火
	$('#input-img').change(function(){

		var file = this.files[0];
		//Fileオブジェクトの作成
		var fileReader = new FileReader();
		fileReader.readAsDataURL(file);
		//読み込みが完了、srcを書き換え
		fileReader.onloadend = function() {
			$('#post-img').attr('src', this.result);
		}
	});


	$('#comment-submit').attr('disabled','disabled');

	$('#comment-text').bind('keydown keyup keypress change', function(){
		if($(this).val().length > 0) {
			$('#comment-submit').removeAttr('disabled');
		} else {
			$('#comment-submit').attr('disabled','disabled');
		}
	});
});

