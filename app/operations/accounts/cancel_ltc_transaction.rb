module Accounts
	class CancelLtcTransaction

		def initialize(account_id:, client_id:, ltc_transaction_id:)
			@account_id 	   		= account_id
			@client_id 		   		= client_id
			@ltc_transaction_id     = ltc_transaction_id 				
			@account                = Account.where(id: @account_id).first
			@ltc_transaction        = LtcTransaction.where(id: @ltc_transaction_id).first
		end

		def execute!
			ActiveRecord::Base.transaction do

	
				if @ltc_transaction.transaction_type == "BUY"
					@ltc_transaction.update!(status: "Cancelled")
					@account.update!(zar_balance: @account.zar_balance + @ltc_transaction.zarSpendAmount) 					
				elsif @ltc_transaction.transaction_type == "SELL"
					@ltc_transaction.update!(status: "Cancelled")
					@account.update!(ltc_balance: @account.ltc_balance + @ltc_transaction.ltcSellAmount) 
				end

			end
			@ltc_transaction
			@account
		end

	end
end