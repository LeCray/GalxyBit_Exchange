module Accounts
	class ValidateNewTransaction

		def initialize(amount:, transaction_type:, account_id:, client_id:)
			@amount 		   = amount.try(:to_f)
			@transaction_type  = transaction_type
			@account_id 	   = account_id
			@client_id		   = client_id
			@account           = Account.where(id: @account_id).first
			@errors = []
		end

		def execute!
			validate_existence_of_account!

			if @transaction_type == 'Withdraw' and @account.present?
				validate_withdrawal!
			end

			@errors
		end

		private 

		def validate_existence_of_account!
			if @account.blank?
				@errors << 'Account not found'
			end
		end

		def validate_withdrawal!
			if @account.balance - @amount < 0.00
				@errors << 'Not enough funds'
			end
		end


	end
end
