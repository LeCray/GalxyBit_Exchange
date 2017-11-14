module Accounts
	class CancelEthTransaction

		def initialize(account_id:, client_id:, eth_transaction_id:)
			@account_id 	   		= account_id
			@client_id 		   		= client_id
			@eth_transaction_id     = eth_transaction_id 				
			@account                = Account.where(id: @account_id).first
			@eth_transaction        = EthTransaction.where(id: @eth_transaction_id).first
		end

		def execute!
			ActiveRecord::Base.transaction do

	
				if @eth_transaction.transaction_type == "BUY"
					@eth_transaction.update!(status: "Cancelled")
					@account.update!(zar_balance: @account.zar_balance + @eth_transaction.zarSpendAmount) 					
				elsif @eth_transaction.transaction_type == "SELL"
					@eth_transaction.update!(status: "Cancelled")
					@account.update!(eth_balance: @account.eth_balance + @eth_transaction.ethSellAmount) 
				end

			end
			@eth_transaction
			@account
		end

	end
end