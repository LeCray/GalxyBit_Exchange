module Accounts
	class PerformTransaction

		def initialize(amount:, transaction_type:, account_id:, client_id:)
			@amount 		   = amount.try(:to_f)
			@transaction_type  = transaction_type
			@account_id 	   = account_id
			@client_id 		   = client_id		
			@account           = Account.where(id: @account_id).first
		end

		def execute!
			ActiveRecord::Base.transaction do

				ZarTransaction.create!(
					account: @account,
					amount: @amount,
					transaction_type: @transaction_type,
				)

				if @transaction_type == 'Withdraw'
					@account.update!(zar_balance: @account.zar_balance - @amount)
				elsif @transaction_type == 'Deposit'
					@account.update!(zar_balance: @account.zar_balance + @amount)				
				end

			end
			@account
		end
	end
end
