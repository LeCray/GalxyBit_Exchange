var Show = (function() {

	var $btnChange;
	var $status
	var $parameters;
	var ClientId;
	var AccountId;
	var url = '/api/v1/admin/change_status';



	var fetchElements = function() {
		
		$btnChange	       		= $('#btn-change');
		$parameters 			= $('#parameters');
		AccountId 				= $parameters.data('account-id');
		ClientId				= $parameters.data('client-id');
		Status 					= $parameters.data('status');
	};



	var initializeEvents = function() {
	

		$btnChange.on("click", function() {
			


			console.log(' Account ID: ' + AccountId + ' Client ID: ' + ClientId + ' Status: ' + Status );		


			$.ajax({
				url: url,
				method: 'POST',
				dataType: 'json',
				data: {
					status: Status,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/admin/' + ClientId 
				}
			});
		});
	};

	var init = function() {
		fetchElements();
		initializeEvents();
	};

	return {
		init: init 
	};
})();




