var ltcNew = (function() {

	var zarSpendAmount;
	var zarRecieveAmount;

	var ltcBuyAmount;
	var ltcSellAmount;

	var $btnBuy;
	var $btnSell;
	
	var $parameters;

	var $notification;

	var $ltcTransactionID;
	var $ltcTransactionType;
	var $btnCancel;

	var ClientId;
	var AccountId;

	var ltcTransaction_url = '/api/v1/litecoin/new_ltc_transaction';
	var cancel_ltc_transaction_url = '/api/v1/litecoin/cancel_ltc_transaction';



	var fetchElements = function() {
		
		$btnBuy 	       		= $('#btn-buy');
		$btnSell 	       		= $('#btn-sell');

		$zarSpendAmount			= $('#cal1');
		$zarRecieveAmount		= $('#cal2');
		$ltcBuyAmount			= $('#result');
		$ltcSellAmount			= $('#result2');	

		$parameters 			= $('#parameters');
		$notification 			= $('.notification');

		$ltcTransactionID       = $('#ltc-transaction-id');
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
	
		//BUYING ETH
		$btnBuy.on("click", function() {
			var zarSpendAmount = $zarSpendAmount.val();
			var ltcBuyAmount = $ltcBuyAmount.val();
			var ltcTransactionType = 'BUY';
			disableControls();	

			console.log('ZarSpend:' + zarSpendAmount + 
						' ltcBuy:' + ltcBuyAmount + 
						' LtcTransactionType:' + ltcTransactionType +
						' AccountID:' + AccountId + 
						' ClientID:' + ClientId
						);		

			$notification.html('');

			$.ajax({
				url: ltcTransaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					zarSpendAmount: zarSpendAmount,
					ltcBuyAmount: ltcBuyAmount,
					ltcTransactionType: ltcTransactionType,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/ltc_transactions'

				},
				error: function(response) {
					$notification.html(JSON.parse(response.responseText).errors.join());
					enableControls();
				}
			}); 
		});

		//SELLING LTC
		$btnSell.on("click", function() {
			var zarRecieveAmount = $zarRecieveAmount.val();
			var ltcSellAmount = $ltcSellAmount.val();
			var ltcTransactionType = 'SELL';
			disableControls();	

			console.log('ZarRecieve:' + zarRecieveAmount + 
						' ltcSell:' + ltcSellAmount +  
						' ltcTransactionType:' + ltcTransactionType +
						' AccountID:' + AccountId + 
						' ClientID:' + ClientId
						);		

			$notification.html('');

			$.ajax({
				url: ltcTransaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					zarRecieveAmount: zarRecieveAmount,
					ltcSellAmount: ltcSellAmount,
					ltcTransactionType: ltcTransactionType,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/ltc_transactions'

				},
				error: function(response) {
					$notification.html(JSON.parse(response.responseText).errors.join());
					enableControls();
				}
			}); 
		});

		// CANCEL ltc TRANSACTION
		$btnCancel.on("click", function() {
			var zarRecieveAmount = $zarRecieveAmount.val();
			var zarSpendAmount = $zarSpendAmount.val();
			var ltcSellAmount = $ltcSellAmount.val();
			var ltcBuyAmount = $ltcBuyAmount.val();
			var ltcTransactionID = $ltcTransactionID.val(); 	

			 
			console.log(' ltcTransactionID: ' + ltcTransactionID +
						' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						' Cancel ' );		


			$.ajax({
				url: cancel_ltc_transaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					ltc_transaction_id: ltcTransactionID,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/ltc_transactions'

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




