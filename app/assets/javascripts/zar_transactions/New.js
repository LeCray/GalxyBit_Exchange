var New = (function() {

	var $btnNewTransaction;
	var $btnSave;
	var $inputAmount;
	var $modalTransaction;
	var $selectTransactionType;
	var $parameters;
	var $notification;

	var $zarTransactionID;
	var $btnCancel;

	var ClientId;
	var AccountId;
	var new_transaction_url = '/api/v1/accounts/new_transaction';
	var cancel_transaction_url = '/api/v1/accounts/cancel_transaction';



	var fetchElements = function() {
		$btnNewTransaction 		= $("#btn-new-transaction");
		$btnSave 	       		= $('#btn-save');
		$inputAmount       		= $('#input-amount');
		$modalTransaction  		= $('#modal-transaction');
		$selectTransactionType 	= $('#select-transaction-type');
		$parameters 			= $('#parameters');
		$notification 			= $('.notification');

		$zarTransactionID       = $('#zar-transaction-id');
		$btnCancel				= $('#btn-cancel');


		AccountId 				= $parameters.data('account-id');
		ClientId				= $parameters.data('client-id');
	};


	var disableControls = function() {
		$btnSave.prop('disabled', true);
		$inputAmount.prop('disabled', true);
		$selectTransactionType.prop('disabled', true);
	};

	var enableControls = function() {
		$btnSave.prop('disabled', false);
		$inputAmount.prop('disabled', false);
		$selectTransactionType.prop('disabled', false);
	};


	var initializeEvents = function() {
	

		$btnSave.on("click", function() {
			var amount = $inputAmount.val();
			var transactionType = $selectTransactionType.val();
			disableControls();	

			console.log('Amount: ' + amount + 
						' Transaction Type: ' + transactionType + 
						' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						' Save ');		

			$notification.html('');

			$.ajax({
				url: new_transaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					amount: amount,
					transaction_type: transactionType,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/zar_transactions'

				},
				error: function(response) {
					$notification.html(JSON.parse(response.responseText).errors.join());
					enableControls();
				}
			});
		});


		$btnCancel.on("click", function() {
			var amount = $inputAmount.val();
			var zarTransactionID = $zarTransactionID.val(); 	

			console.log('Amount: ' + amount + 
						' ZarTransactionID: ' + zarTransactionID +
						' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						' Cancel ' );		


			$.ajax({
				url: cancel_transaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					amount: amount,
					zar_transaction_id: zarTransactionID,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/zar_transactions'

				},
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




