module Accounts
	class ValidateNewLtcTransaction

		def initialize(zarSpendAmount:, ltcSellAmount:, ltcTransactionType:, account_id:, client_id:)
			@zarSpendAmount			= zarSpendAmount.try(:to_f)
			@ltcSellAmount			= ltcSellAmount.try(:to_f)
			@ltcTransactionType  	= ltcTransactionType
			@account_id 	   		= account_id
			@client_id		   		= client_id
			@account           		= Account.where(id: @account_id).first
			@errors = []
		end

		def execute!
			validate_existence_of_account!

			if @ltcTransactionType == 'BUY' && @account.present?
				validate_zar_balance!
			end

			if @ltcTransactionType == 'SELL' and @account.present?
				validate_ltc_sell!
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

		def validate_ltc_sell!
			if @account.ltc_balance - @ltcSellAmount < 0.00
				@errors << 'NOT ENOUGH LITECOINS'
			end
		end


	end
end
