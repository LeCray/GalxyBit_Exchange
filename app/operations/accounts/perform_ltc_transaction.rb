module Accounts
	class PerformLtcTransaction

		def initialize(zarSpendAmount:,ltcBuyAmount:,zarRecieveAmount:,ltcSellAmount:, ltcTransactionType:, account_id:, client_id:)
			@zarSpendAmount		   = zarSpendAmount.try(:to_f)
			@ltcBuyAmount 		   = ltcBuyAmount.try(:to_f)

			@zarRecieveAmount      = zarRecieveAmount.try(:to_f)
			@ltcSellAmount		   = ltcSellAmount.try(:to_f)	

			@transaction_type      = ltcTransactionType
			@account_id 	   	   = account_id
			@client_id 		       = client_id		
			@account               = Account.where(id: @account_id).first
		end

		def execute!
			ActiveRecord::Base.transaction do

				if @transaction_type == 'BUY'
					@ltcSellAmount = 0.00
				else
					@ltcBuyAmount = 0.00
				end

				LtcTransaction.create!(
					account: @account,
					ltcBuyAmount: @ltcBuyAmount,
					ltcSellAmount: @ltcSellAmount,
					zarSpendAmount: @zarSpendAmount,
					zarRecieveAmount: @zarRecieveAmount,
					transaction_type: @transaction_type,
				)

				if @transaction_type == 'BUY'	
					@account.update!(zar_balance: @account.zar_balance - @zarSpendAmount)	
				else
					@account.update!(ltc_balance: @account.ltc_balance - @ltcSellAmount)			
				end

			end
			@account
		end
	end
end
