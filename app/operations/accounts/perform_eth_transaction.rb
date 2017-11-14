module Accounts
	class PerformEthTransaction

		def initialize(zarSpendAmount:,ethBuyAmount:,zarRecieveAmount:,ethSellAmount:, ethTransactionType:, account_id:, client_id:)
			@zarSpendAmount		   = zarSpendAmount.try(:to_f)
			@ethBuyAmount 		   = ethBuyAmount.try(:to_f)

			@zarRecieveAmount      = zarRecieveAmount.try(:to_f)
			@ethSellAmount		   = ethSellAmount.try(:to_f)	

			@transaction_type    = ethTransactionType
			@account_id 	   	   = account_id
			@client_id 		       = client_id		
			@account               = Account.where(id: @account_id).first
		end

		def execute!
			ActiveRecord::Base.transaction do

				if @transaction_type == 'BUY'
					@ethSellAmount = 0.00
				else
					@ethBuyAmount = 0.00
				end

				EthTransaction.create!(
					account: @account,
					ethBuyAmount: @ethBuyAmount,
					ethSellAmount: @ethSellAmount,
					zarSpendAmount: @zarSpendAmount,
					zarRecieveAmount: @zarRecieveAmount,
					transaction_type: @transaction_type,
				)

				if @transaction_type == 'BUY'	
					@account.update!(zar_balance: @account.zar_balance - @zarSpendAmount)	
				else
					@account.update!(eth_balance: @account.eth_balance - @ethSellAmount)			
				end

			end
			@account
		end
	end
end
