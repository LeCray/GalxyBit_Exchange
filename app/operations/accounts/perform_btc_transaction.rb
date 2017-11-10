module Accounts
	class PerformBtcTransaction

		def initialize(zarSpendAmount:,btcBuyAmount:,zarRecieveAmount:,btcSellAmount:, btcTransactionType:, account_id:, client_id:)
			@zarSpendAmount		   = zarSpendAmount.try(:to_f)
			@btcBuyAmount 		   = btcBuyAmount.try(:to_f)

			@zarRecieveAmount      = zarRecieveAmount.try(:to_f)
			@btcSellAmount		   = btcSellAmount.try(:to_f)	

			@btcTransactionType    = btcTransactionType
			@account_id 	   	   = account_id
			@client_id 		       = client_id		
			@account               = Account.where(id: @account_id).first
		end

		def execute!
			ActiveRecord::Base.transaction do

				if @btcTransactionType == 'BUY'
					@amount = @btcBuyAmount
				else 
					@amount = @btcSellAmount
				end

				BtcTransaction.create!(
					account: @account,
					amount: @btcBuyAmount,
					btcSellAmount: @btcSellAmount,
					btcTransactionType: @btcTransactionType,
				)

				if @btcTransactionType == 'BUY'
					@account.update!(btc_balance: @account.btc_balance + @btcBuyAmount)	
				else
					@account.update!(btc_balance: @account.btc_balance - @btcSellAmount)			
				end

			end
			@account
		end
	end
end
