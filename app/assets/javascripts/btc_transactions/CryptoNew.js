var CryptoNew = (function() {

	var zarSpendAmount;
	var zarRecieveAmount;

	var btcBuyAmount;
	var btcSellAmount;

	var $btnSave;
	
	var $parameters;

	var $notification;

	var $btcTransactionID;
	var $btnCancel;

	var ClientId;
	var AccountId;
	var new_transaction_url = '/api/v1/accounts/new_transaction';
	var cancel_transaction_url = '/api/v1/accounts/cancel_transaction';



	var fetchElements = function() {
		
		$btnSave 	       		= $('#btn-save');
		
		
		$zarSpendAmount			= $('#cal1')
		$zarRecieveAmount		= $('#cal2')
		$btcBuyAmount			= $('#result')
		$btcSellAmount			= $('#result2')	

		$parameters 			= $('#parameters');
		$notification 			= $('.notification');

		$zarTransactionID       = $('#zar-transaction-id');
		$btnCancel				= $('#btn-cancel');


		AccountId 				= $parameters.data('account-id');
		ClientId				= $parameters.data('client-id');
	};


	var disableControls = function() {
		$btnSave.prop('disabled', true);
	
	};

	var enableControls = function() {
		$btnSave.prop('disabled', false);
	
	};


	var initializeEvents = function() {
	

		$btnSave.on("click", function() {
			var zarSpendAmount = $zarSpendAmount.val();
			var btcBuyAmount = $btcBuyAmount.val();
			disableControls();	

			console.log('ZarSpend:' + zarSpendAmount + 
						' btcBuy:' + btcBuyAmount +  
						' AccountID:' + AccountId + 
						' ClientID:' + ClientId
						);		

			//$notification.html('');

			/*$.ajax({
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
			}); */
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




