	$(function(){ // If you are not familiar with jQuery, this will run when the page is loaded and ready
	  $('#btc').click(function(){
	    $('.btc_chart').show(); 
	    $('.eth_chart').hide();
	    $('.ltc_chart').hide();
	  });
	});

	$(function(){ // If you are not familiar with jQuery, this will run when the page is loaded and ready
	  $('#eth').click(function(){
	    $('.eth_chart').show(); 
	    $('.btc_chart').hide();
	    $('.ltc_chart').hide();
	  });
	});

	$(function(){ // If you are not familiar with jQuery, this will run when the page is loaded and ready
	  $('#ltc').click(function(){
	    $('.ltc_chart').show(); 
	    $('.btc_chart').hide();
	    $('.eth_chart').hide();
	  });
	});

	