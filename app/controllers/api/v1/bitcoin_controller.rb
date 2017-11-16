module Api
	module V1
		class BitcoinController < ApplicationController

			def new_btc_transaction
				btcTransactionType  = params[:btcTransactionType]
				value  			    = params[:value]
				
				#For Buying
				zarSpendAmount 	  =	params[:zarSpendAmount]
				btcBuyAmount 	  = params[:btcBuyAmount]

				#For Selling
				zarRecieveAmount  =	params[:zarRecieveAmount]
				btcSellAmount 	  = params[:btcSellAmount]

				#Client Details
				account_id 		  = params[:account_id]
				client_id		  = params[:client_id]

				errors = ::Accounts::ValidateNewBtcTransaction.new(
							zarSpendAmount: zarSpendAmount,
							btcSellAmount: btcSellAmount,
							btcTransactionType: btcTransactionType,
							account_id: account_id,
							client_id: client_id
					).execute!

				if errors.size > 0
					render json: { errors: errors }, status: 402
				else
					account = ::Accounts::PerformBtcTransaction.new(
							#Buying
							zarSpendAmount: zarSpendAmount,
							btcBuyAmount: btcBuyAmount, 
							#Selling
							zarRecieveAmount: zarRecieveAmount,	
							btcSellAmount: btcSellAmount,

							btcTransactionType: btcTransactionType,
							value: value,
							account_id: account_id,
							client_id: client_id
							).execute!		
				end
			end


			def cancel_btc_transaction
			
				btc_transaction_id	= params[:btc_transaction_id]
				account_id 		  	= params[:account_id]
				client_id		  	= params[:client_id]

				btc_transaction = ::Accounts::CancelBtcTransaction.new(
							account_id: account_id,
							client_id: client_id,
							btc_transaction_id: btc_transaction_id,	
						).execute!
			end
		end
	end
end
