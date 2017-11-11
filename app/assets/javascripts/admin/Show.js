var Show = (function() {

	var $btnZarChange;
	var $btnBtcChange;
	var $btnLtcChange;
	var $btnEthChange;

	var $selectStatusType;
	var $zarTransactionID;
	var $parameters;
	var ClientId;
	var AccountId;
	var url = '/api/v1/admin/change_status';



	var fetchElements = function() {
		
		$btnZarChange	       	= $('#btn-zar-change');
		$selectStatusType 		= $('#select-status-type');
		$zarTransactionID       = $('#zar-transaction-id');
		$parameters 			= $('#parameters');
		AccountId 				= $parameters.data('account-id');
		ClientId				= $parameters.data('client-id');
	};



	var initializeEvents = function() {
	

		$btnZarChange.on("click", function() {
			var change_status_to = $selectStatusType.val();
			var zar_transaction_id = $zarTransactionID.val();
			
			console.log(' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						' Change_Status_To: ' + change_status_to +
						' ZarTransactionID: ' + zar_transaction_id	
						 );		


			$.ajax({
				url: url,
				method: 'POST',
				dataType: 'json',
				data: {
					change_status_to: change_status_to,
					zar_transaction_id: zar_transaction_id,
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




