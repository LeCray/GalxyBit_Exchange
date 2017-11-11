module Accounts
	class ChangeEthStatus

		def initialize(account_id:, client_id:, change_status_to:,eth_transaction_id:)
			@account_id 	   		= account_id
			@client_id 		   		= client_id
			@change_status_to  	    = change_status_to		
			@eth_transaction_id     = eth_transaction_id
			@account                = Account.where(id: @account_id).first
			@eth_transaction        = EthTransaction.where(id: @eth_transaction_id).first
			
		end

		def execute!
			ActiveRecord::Base.transaction do

				if @change_status_to == 'Approved'
					@eth_transaction.update!(status: @change_status_to)
					if @eth_transaction.transaction_type == "BUY"
						@account.update!(eth_balance: @account.eth_balance + @eth_transaction.ethBuyAmount)
					end
					elsif @change_status_to == 'Cancelled'
						@eth_transaction.update!(status: @change_status_to)	

						if @eth_transaction.transaction_type == "SELL"
							@account.update!(eth_balance: @account.eth_balance + @eth_transaction.ethSellAmount) 
						elsif @eth_transaction.transaction_type == "BUY"
						 	@account.update!(eth_balance: @account.eth_balance - @eth_transaction.ethBuyAmount)
					end
				end

			end
			@eth_transaction
			@account
		end
	end
end
