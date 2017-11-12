module Accounts
	class CancelBtcTransaction

		def initialize(account_id:, client_id:, btc_transaction_id:)
			@account_id 	   		= account_id
			@client_id 		   		= client_id
			@btc_transaction_id     = btc_transaction_id 				
			@account                = Account.where(id: @account_id).first
			@btc_transaction        = BtcTransaction.where(id: @btc_transaction_id).first
		end

		def execute!
			ActiveRecord::Base.transaction do

	
				if @btc_transaction.transaction_type == "BUY"
					@btc_transaction.update!(status: "Cancelled")
					@account.update!(zar_balance: @account.zar_balance + @btc_transaction.zarSpendAmount) 					
				elsif @btc_transaction.transaction_type == "SELL"
					@btc_transaction.update!(status: "Cancelled")
					@account.update!(btc_balance: @account.btc_balance + @btc_transaction.btcSellAmount) 
				end

			end
			@btc_transaction
			@account
		end

	end
end