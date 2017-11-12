module Accounts
	class ChangeBtcStatus

		def initialize(account_id:, client_id:, change_status_to:,btc_transaction_id:)
			@account_id 	   		= account_id
			@client_id 		   		= client_id
			@change_status_to  	    = change_status_to		
			@btc_transaction_id     = btc_transaction_id
			@account                = Account.where(id: @account_id).first
			@btc_transaction        = BtcTransaction.where(id: @btc_transaction_id).first
			
		end

		def execute!
			ActiveRecord::Base.transaction do

				if @change_status_to == 'Approved'
					@btc_transaction.update!(status: @change_status_to)
					if @btc_transaction.transaction_type == "BUY"
						@account.update!(btc_balance: @account.btc_balance + @btc_transaction.btcBuyAmount)
					elsif @btc_transaction.transaction_type == "SELL"
						@account.update!(zar_balance: @account.zar_balance + @btc_transaction.zarRecieveAmount)
					end
					elsif @change_status_to == 'Cancelled'
						@btc_transaction.update!(status: @change_status_to)	

						if @btc_transaction.transaction_type == "BUY"
						 	@account.update!(zar_balance: @account.zar_balance + @btc_transaction.zarSpendAmount)
						elsif @btc_transaction.transaction_type == "SELL"
							@account.update!(btc_balance: @account.btc_balance + @btc_transaction.btcSellAmount) 
					end
				end

			end
			@btc_transaction
			@account
		end
	end
end
