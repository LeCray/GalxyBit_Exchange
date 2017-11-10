var CryptoNew = (function() {

	var zarSpendAmount;
	var zarRecieveAmount;

	var btcBuyAmount;
	var btcSellAmount;

	var $btnBuy;
	var $btnSell;
	
	var $parameters;

	var $notification;

	var $btcTransactionID;
	var $btcTransactionType;
	var $btnCancel;

	var ClientId;
	var AccountId;

	var btcTransaction_url = '/api/v1/bitcoin/new_btc_transaction';
	var cancel_transaction_url = '/api/v1/bitcoin/cancel_transaction';



	var fetchElements = function() {
		
		$btnBuy 	       		= $('#btn-buy');
		$btnSell 	       		= $('#btn-sell');

		
		
		$zarSpendAmount			= $('#cal1');
		$zarRecieveAmount		= $('#cal2');
		$btcBuyAmount			= $('#result');
		$btcSellAmount			= $('#result2');	

		$parameters 			= $('#parameters');
		$notification 			= $('.notification');

		$btcTransactionID       = $('#zar-transaction-id');
		$btnCancel				= $('#btn-cancel');


		AccountId 				= $parameters.data('account-id');
		ClientId				= $parameters.data('client-id');
	};


	var disableControls = function() {
		$btnBuy.prop('disabled', true);
		$btnSell.prop('disabled', true);
	};
	var enableControls = function() {
		$btnBuy.prop('disabled', false);
		$btnSell.prop('disabled', false);
	};


	var initializeEvents = function() {
	
		//Buying BTC
		$btnBuy.on("click", function() {
			var zarSpendAmount = $zarSpendAmount.val();
			var btcBuyAmount = $btcBuyAmount.val();
			var btcTransactionType = 'BUY';
			disableControls();	

			console.log('ZarSpend:' + zarSpendAmount + 
						' btcBuy:' + btcBuyAmount + 
						' btcTransactionType:' + btcTransactionType +
						' AccountID:' + AccountId + 
						' ClientID:' + ClientId
						);		

			$notification.html('');

			$.ajax({
				url: btcTransaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					zarSpendAmount: zarSpendAmount,
					btcBuyAmount: btcBuyAmount,
					btcTransactionType: btcTransactionType,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/btc_transactions'

				},
				error: function(response) {
					$notification.html(JSON.parse(response.responseText).errors.join());
					enableControls();
				}
			}); 
		});

		//Selling BTC
		$btnSell.on("click", function() {
			var zarRecieveAmount = $zarRecieveAmount.val();
			var btcSellAmount = $btcSellAmount.val();
			var btcTransactionType = 'SELL';
			disableControls();	

			console.log('ZarRecieve:' + zarRecieveAmount + 
						' btcSell:' + btcSellAmount +  
						' btcTransactionType:' + btcTransactionType +
						' AccountID:' + AccountId + 
						' ClientID:' + ClientId
						);		

			$notification.html('');

			$.ajax({
				url: btcTransaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					zarRecieveAmount: zarRecieveAmount,
					btcSellAmount: btcSellAmount,
					btcTransactionType: btcTransactionType,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/btc_transactions'

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




