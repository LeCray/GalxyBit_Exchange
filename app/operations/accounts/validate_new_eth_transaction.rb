module Accounts
	class ValidateNewEthTransaction

		def initialize(zarSpendAmount:, ethSellAmount:, ethTransactionType:, account_id:, client_id:)
			@zarSpendAmount			= zarSpendAmount.try(:to_f)
			@ethSellAmount			= ethSellAmount.try(:to_f)
			@ethTransactionType  	= ethTransactionType
			@account_id 	   		= account_id
			@client_id		   		= client_id
			@account           		= Account.where(id: @account_id).first
			@errors = []
		end

		def execute!
			validate_existence_of_account!

			if @ethTransactionType == 'BUY' && @account.present?
				validate_zar_balance!
			end

			if @ethTransactionType == 'SELL' and @account.present?
				validate_eth_sell!
			end

			@errors
		end

		private 

		def validate_existence_of_account!
			if @account.blank?
				@errors << 'Account not found'
			end
		end

		def validate_zar_balance!
			if @account.zar_balance - @zarSpendAmount < 0.00
				@errors << 'NOT ENOUGH MONEY'
			end
		end

		def validate_eth_sell!
			if @account.eth_balance - @ethSellAmount < 0.00
				@errors << 'NOT ENOUGH ETHER'
			end
		end


	end
end
