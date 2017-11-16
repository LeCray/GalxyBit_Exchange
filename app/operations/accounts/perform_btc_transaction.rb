module Accounts
	class PerformBtcTransaction

		def initialize(zarSpendAmount:,btcBuyAmount:,zarRecieveAmount:,
						btcSellAmount:, btcTransactionType:,
						account_id:, client_id:, value:)
			@zarSpendAmount		   = zarSpendAmount.try(:to_f)
			@btcBuyAmount 		   = btcBuyAmount.try(:to_f)

			@zarRecieveAmount      = zarRecieveAmount.try(:to_f)
			@btcSellAmount		   = btcSellAmount.try(:to_f)	

			@transaction_type      = btcTransactionType
			@value 				   = value
			@account_id 	   	   = account_id
			@client_id 		       = client_id		
			@account               = Account.where(id: @account_id).first
		end

		def execute!
			ActiveRecord::Base.transaction do

				if @transaction_type == 'BUY'
					@btcSellAmount = 0.00
				else
					@btcBuyAmount = 0.00
				end

				BtcTransaction.create!(
					account: @account,
					btcBuyAmount: @btcBuyAmount,
					btcSellAmount: @btcSellAmount,
					zarSpendAmount: @zarSpendAmount,
					zarRecieveAmount: @zarRecieveAmount,
					transaction_type: @transaction_type,
					value: @value
				)

				if @transaction_type == 'BUY'	
					@account.update!(zar_balance: @account.zar_balance - @zarSpendAmount)	
				else
					@account.update!(btc_balance: @account.btc_balance - @btcSellAmount)			
				end

			end
			@account
		end
	end
end
