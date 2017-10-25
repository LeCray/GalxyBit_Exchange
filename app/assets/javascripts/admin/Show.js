var Show = (function() {

	var $btnChange;
	var $status;
	var $selectStatusType;
	var $zarTransactionId;
	var $parameters;
	var ClientId;
	var AccountId;
	var url = '/api/v1/admin/change_status';



	var fetchElements = function() {
		
		$btnChange	       		= $('#btn-change');
		$selectStatusType 		= $('#select-status-type');
		$zarTransactionId       = $('#zar-transaction-id');
		$parameters 			= $('#parameters');
		AccountId 				= $parameters.data('account-id');
		ClientId				= $parameters.data('client-id');
		Status 					= $parameters.data('status');
	};



	var initializeEvents = function() {
	

		$btnChange.on("click", function() {
			var change_status_to = $selectStatusType.val();
			var zar_transaction_id = $zarTransactionId.val();
			
			console.log(' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						' Current Status: ' + Status + 
						' Change_Status_To: ' + change_status_to +
						' ZarTransactionId: ' + zar_transaction_id	
						 );		


			$.ajax({
				url: url,
				method: 'POST',
				dataType: 'json',
				data: {
					status: Status,
					change_status_to: change_status_to,
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




