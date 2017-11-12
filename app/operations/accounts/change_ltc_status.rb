module Accounts
	class ChangeLtcStatus

		def initialize(account_id:, client_id:, change_status_to:,ltc_transaction_id:)
			@account_id 	   		= account_id
			@client_id 		   		= client_id
			@change_status_to  	    = change_status_to		
			@ltc_transaction_id     = ltc_transaction_id
			@account                = Account.where(id: @account_id).first
			@ltc_transaction        = LtcTransaction.where(id: @ltc_transaction_id).first
			
		end

		def execute!
			ActiveRecord::Base.transaction do

				if @change_status_to == 'Approved'
					@ltc_transaction.update!(status: @change_status_to)
					if @ltc_transaction.transaction_type == "BUY"
						@account.update!(ltc_balance: @account.ltc_balance + @ltc_transaction.ltcBuyAmount)
					elsif @ltc_transaction.transaction_type == "SELL"
						@account.update!(zar_balance: @account.zar_balance + @ltc_transaction.zarRecieveAmount)	
					end
					elsif @change_status_to == 'Cancelled'
						@ltc_transaction.update!(status: @change_status_to)	

						if @ltc_transaction.transaction_type == "SELL"
							@account.update!(ltc_balance: @account.ltc_balance + @ltc_transaction.ltcSellAmount) 
						elsif @ltc_transaction.transaction_type == "BUY"
						 	@account.update!(ltc_balance: @account.ltc_balance - @ltc_transaction.ltcBuyAmount)
					end
				end

			end
			@ltc_transaction
			@account
		end
	end
end
