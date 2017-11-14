var Show = (function() {

	var $btnZarChange;
	var $btnBtcChange;
	var $btnLtcChange;
	var $btnEthChange;

	var $selectStatusType;

	var $zarTransactionID;
	var $btcTransactionID;
	var $ltcTransactionID; 
	var $ethTransactionID;

	var $parameters;
	var ClientId;
	var AccountId;
	var url = '/api/v1/admin/change_status';



	var fetchElements = function() {
		
		$btnZarChange	       	= $('#btn-zar-change');
		$zarTransactionID       = $('#zar-transaction-id');
		$selectStatusType 		= $('#select-status-type');

		$btnBtcChange			= $('#btn-btc-change');
		$btcTransactionID       = $('#btc-transaction-id');
		$btcStatusType 		    = $('#select-btc-status-type');

		$btnLtcChange			= $('#btn-ltc-change');
		$ltcTransactionID       = $('#ltc-transaction-id');
		$ltcStatusType 		    = $('#select-ltc-status-type');

		$btnEthChange			= $('#btn-eth-change');
		$ethTransactionID       = $('#eth-transaction-id');
		$ethStatusType 		    = $('#select-eth-status-type')

		$parameters 			= $('#parameters');
		AccountId 				= $parameters.data('account-id');
		ClientId				= $parameters.data('client-id');
	};



	var initializeEvents = function() {
	
		//ZARR
		$btnZarChange.on("click", function() {
			var change_status_to = $selectStatusType.val();
			var zar_transaction_id = $zarTransactionID.val();
			var btc_transaction_id = 0;
			var ltc_transaction_id = 0;
			var eth_transaction_id = 0;
			
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

					btc_transaction_id: btc_transaction_id,
					ltc_transaction_id: ltc_transaction_id,
					eth_transaction_id: eth_transaction_id,

					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/admin/' + ClientId 
				}
			});
		});

		//BITCOINS
		$btnBtcChange.on("click", function() {
			var change_status_to = $btcStatusType.val();
			var btc_transaction_id = $btcTransactionID.val();
			var zar_transaction_id = 0
			var ltc_transaction_id = 0
			var eth_transaction_id = 0
			
			console.log(' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						' Change_Status_To: ' + change_status_to +
						' BtcTransactionID: ' + btc_transaction_id	
						 );		
			$.ajax({
				url: url,
				method: 'POST',
				dataType: 'json',
				data: {
					change_status_to: change_status_to,
					btc_transaction_id: btc_transaction_id,

					ltc_transaction_id: ltc_transaction_id,
					zar_transaction_id: zar_transaction_id,
					eth_transaction_id: eth_transaction_id,

					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/admin/' + ClientId 
				}
			});
		});

		//LITECOINS
		$btnLtcChange.on("click", function() {
			var change_status_to = $ltcStatusType.val();
			var ltc_transaction_id = $ltcTransactionID.val();
			var zar_transaction_id = 0
			var btc_transaction_id = 0
			var eth_transaction_id = 0
			
			console.log(' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						' Change_Status_To: ' + change_status_to +
						' LtcTransactionID: ' + ltc_transaction_id	
						 );		
			$.ajax({
				url: url,
				method: 'POST',
				dataType: 'json',
				data: {
					change_status_to: change_status_to,
					ltc_transaction_id: ltc_transaction_id,

					zar_transaction_id: zar_transaction_id,
					btc_transaction_id: btc_transaction_id,
					eth_transaction_id: eth_transaction_id,

					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/admin/' + ClientId 
				}
			});
		});

		//ETHEREUM
		$btnEthChange.on("click", function() {
			var change_status_to = $ethStatusType.val();
			var eth_transaction_id = $ethTransactionID.val();
			var zar_transaction_id = 0
			var ltc_transaction_id = 0
			var btc_transaction_id = 0
			
			console.log(' Account ID: ' + AccountId + 
						' Client ID: ' + ClientId + 
						' Change_Status_To: ' + change_status_to +
						' EthTransactionID: ' + eth_transaction_id	
						 );		
			$.ajax({
				url: url,
				method: 'POST',
				dataType: 'json',
				data: {
					change_status_to: change_status_to,
					eth_transaction_id: eth_transaction_id,

					zar_transaction_id: zar_transaction_id,
					btc_transaction_id: btc_transaction_id,
					ltc_transaction_id: ltc_transaction_id,

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




