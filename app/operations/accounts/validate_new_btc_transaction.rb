module Accounts
	class ValidateNewBtcTransaction

		def initialize(zarSpendAmount:, btcSellAmount:, btcTransactionType:, account_id:, client_id:)
			@zarSpendAmount			= zarSpendAmount.try(:to_f)
			@btcSellAmount			= btcSellAmount.try(:to_f)
			@btcTransactionType  	= btcTransactionType
			@account_id 	   		= account_id
			@client_id		   		= client_id
			@account           		= Account.where(id: @account_id).first
			@errors = []
		end

		def execute!
			validate_existence_of_account!

			if @btcTransactionType == 'BUY' && @account.present?
				validate_zar_balance!
			end

			if @btcTransactionType == 'SELL' and @account.present?
				validate_btc_sell!
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

		def validate_btc_sell!
			if @account.btc_balance - @btcSellAmount < 0.00
				@errors << 'NOT ENOUGH BITCOINS'
			end
		end


	end
end
