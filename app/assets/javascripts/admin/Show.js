var Show = (function() {

	var $btnChange;
	//var $status;
	var $selectStatusType;
	var $zarTransactionDate;
	var $parameters;
	var ClientId;
	var AccountId;
	var url = '/api/v1/admin/change_status';



	var fetchElements = function() {
		
		$btnChange	       		= $('#btn-change');
		$selectStatusType 		= $('#select-status-type');
		$zarTransactionDate       = $('#zar-transaction-date');
		$parameters 			= $('#parameters');
		AccountId 				= $parameters.data('account-id');
		ClientId				= $parameters.data('client-id');
		//Status 					= $parameters.data('status');
	};



	var initializeEvents = function() {
	

		$btnChange.on("click", function() {
			var change_status_to = $selectStatusType.val();
			var zar_transaction_date = $zarTransactionDate.val();
			
			console.log(' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						//' Current Status: ' + Status + 
						' Change_Status_To: ' + change_status_to +
						' ZarTransactionDate: ' + zar_transaction_date	
						 );		


			$.ajax({
				url: url,
				method: 'POST',
				dataType: 'json',
				data: {
					//status: Status,
					change_status_to: change_status_to,
					zar_transaction_date: zar_transaction_date,
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




