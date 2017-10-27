module Accounts
	class CancelTransaction

		def initialize(account_id:, client_id:, zar_transaction_id:)
			@account_id 	   		= account_id
			@client_id 		   		= client_id
			@zar_transaction_id     = zar_transaction_id
			@account                = Account.where(id: @account_id).first
			@zar_transaction        = ZarTransaction.where(id: @zar_transaction_id).first
		end

		def execute!
			ActiveRecord::Base.transaction do

	
				if @zar_transaction.transaction_type == "Withdraw"
					@account.update!(zar_balance: @account.zar_balance + @zar_transaction.amount) 
					@zar_transaction.update!(status: "Cancelled")

				elsif @zar_transaction.transaction_type == "Deposit"
					@zar_transaction.update!(status: "Cancelled")
				 	
				end

			end
			@zar_transaction
			@account
		end

	end
end