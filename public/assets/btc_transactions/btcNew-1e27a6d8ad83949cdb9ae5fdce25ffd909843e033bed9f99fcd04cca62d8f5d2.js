var btcNew = (function() {

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
	var Value;

	var btcTransaction_url = '/api/v1/bitcoin/new_btc_transaction';
	var cancel_btc_transaction_url = '/api/v1/bitcoin/cancel_btc_transaction';



	var fetchElements = function() {
		
		$btnBuy 	       		= $('#btn-buy');
		$btnSell 	       		= $('#btn-sell');

		$zarSpendAmount			= $('#cal1');
		$zarRecieveAmount		= $('#cal2');
		$btcBuyAmount			= $('#result');
		$btcSellAmount			= $('#result2');	

		$parameters 			= $('#parameters');
		$notification 			= $('.notification');

		$btcTransactionID       = $('#btc-transaction-id');
		$btnCancel				= $('#btn-cancel');

		AccountId 				= $parameters.data('account-id');
		ClientId				= $parameters.data('client-id');
		Value 					= $parameters.data('value');
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
	
		//BUYING BTC
		$btnBuy.on("click", function() {
			var zarSpendAmount = $zarSpendAmount.val();
			var btcBuyAmount = $btcBuyAmount.val();
			var btcTransactionType = 'BUY';
			disableControls();	

			console.log('ZarSpend:' + zarSpendAmount + 
						' btcBuy:' + btcBuyAmount + 
						' btcTransactionType:' + btcTransactionType +
						' Value:' + Value +
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
					value: Value,
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

		//SELLING BTC
		$btnSell.on("click", function() {
			var zarRecieveAmount = $zarRecieveAmount.val();
			var btcSellAmount = $btcSellAmount.val();
			var btcTransactionType = 'SELL';
			disableControls();	

			console.log('ZarRecieve:' + zarRecieveAmount + 
						' btcSell:' + btcSellAmount +  
						' btcTransactionType:' + btcTransactionType +
						' Value:' + Value +
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
					value: Value,
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

		// CANCEL BTC TRANSACTION
		$btnCancel.on("click", function() {
			var zarRecieveAmount = $zarRecieveAmount.val();
			var zarSpendAmount = $zarSpendAmount.val();
			var btcSellAmount = $btcSellAmount.val();
			var btcBuyAmount = $btcBuyAmount.val();
			var btcTransactionID = $btcTransactionID.val(); 	

			 
			console.log(' BtcTransactionID: ' + btcTransactionID +
						' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						' Cancel ' );		


			$.ajax({
				url: cancel_btc_transaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					btc_transaction_id: btcTransactionID,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/btc_transactions'

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




