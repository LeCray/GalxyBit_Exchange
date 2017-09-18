var Show = (function() {

	var $btnNewTransaction;
	var $btnSave;
	var $inputAmount;
	var $modalTransaction;
	var $selectTransactionType;
	var $parameters;
	var $notification;

	var ClientId;
	var AccountId;
	var url = '/api/v1/accounts/new_transaction';

	var fetchElements = function() {
		$btnNewTransaction 		= $("#btn-new-transaction");
		$btnSave 	       		= $('#btn-save');
		$inputAmount       		= $('#input-amount');
		$modalTransaction  		= $('#modal-transaction');
		$selectTransactionType 	= $('#select-transaction-type');
		$parameters 			= $('#parameters');
		$notification 			= $('.notification');

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
		$btnNewTransaction.on("click", function() {
			$modalTransaction.modal('show');			
		});

		$btnSave.on("click", function() {
			var amount = $inputAmount.val();
			var transactionType = $selectTransactionType.val();
			disableControls();	

			console.log('Amount: ' + amount + ' Transaction Type: ' + transactionType + ' Account ID: ' + AccountId + ' Client ID: ' + ClientId);		

			$notification.html('');

			$.ajax({
				url: url,
				method: 'POST',
				dataType: 'json',
				data: {
					amount: amount,
					transaction_type: transactionType,
					account_id: AccountId,
					client_id: ClientId
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/accounts/'+ AccountId;
				},
				error: function(response) {
					$notification.html(JSON.parse(response.responseText).errors.join());
					enableControls();
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
