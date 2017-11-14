var ethNew = (function() {

	var zarSpendAmount;
	var zarRecieveAmount;

	var ethBuyAmount;
	var ethSellAmount;

	var $btnBuy;
	var $btnSell;
	
	var $parameters;

	var $notification;

	var $ethTransactionID;
	var $ethTransactionType;
	var $btnCancel;

	var ClientId;
	var AccountId;

	var ethTransaction_url = '/api/v1/ethereum/new_eth_transaction';
	var cancel_eth_transaction_url = '/api/v1/ethereum/cancel_eth_transaction';



	var fetchElements = function() {
		
		$btnBuy 	       		= $('#btn-buy');
		$btnSell 	       		= $('#btn-sell');

		$zarSpendAmount			= $('#cal1');
		$zarRecieveAmount		= $('#cal2');
		$ethBuyAmount			= $('#result');
		$ethSellAmount			= $('#result2');	

		$parameters 			= $('#parameters');
		$notification 			= $('.notification');

		$ethTransactionID       = $('#eth-transaction-id');
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
			var ethBuyAmount = $ethBuyAmount.val();
			var ethTransactionType = 'BUY';
			disableControls();	

			console.log('ZarSpend:' + zarSpendAmount + 
						' ethBuy:' + ethBuyAmount + 
						' ethTransactionType:' + ethTransactionType +
						' AccountID:' + AccountId + 
						' ClientID:' + ClientId
						);		

			$notification.html('');

			$.ajax({
				url: ethTransaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					zarSpendAmount: zarSpendAmount,
					ethBuyAmount: ethBuyAmount,
					ethTransactionType: ethTransactionType,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/eth_transactions'

				},
				error: function(response) {
					$notification.html(JSON.parse(response.responseText).errors.join());
					enableControls();
				}
			}); 
		});

		//SELLING ETH
		$btnSell.on("click", function() {
			var zarRecieveAmount = $zarRecieveAmount.val();
			var ethSellAmount = $ethSellAmount.val();
			var ethTransactionType = 'SELL';
			disableControls();	

			console.log('ZarRecieve:' + zarRecieveAmount + 
						' ethSell:' + ethSellAmount +  
						' ethTransactionType:' + ethTransactionType +
						' AccountID:' + AccountId + 
						' ClientID:' + ClientId
						);		

			$notification.html('');

			$.ajax({
				url: ethTransaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					zarRecieveAmount: zarRecieveAmount,
					ethSellAmount: ethSellAmount,
					ethTransactionType: ethTransactionType,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/eth_transactions'

				},
				error: function(response) {
					$notification.html(JSON.parse(response.responseText).errors.join());
					enableControls();
				}
			}); 
		});

		// CANCEL eth TRANSACTION
		$btnCancel.on("click", function() {
			var zarRecieveAmount = $zarRecieveAmount.val();
			var zarSpendAmount = $zarSpendAmount.val();
			var ethSellAmount = $ethSellAmount.val();
			var ethBuyAmount = $ethBuyAmount.val();
			var ethTransactionID = $ethTransactionID.val(); 	

			 
			console.log(' EthTransactionID: ' + ethTransactionID +
						' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						' Cancel ' );		


			$.ajax({
				url: cancel_eth_transaction_url,
				method: 'POST',
				dataType: 'json',
				data: {
					eth_transaction_id: ethTransactionID,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/clients/' + ClientId + '/eth_transactions'

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




		
