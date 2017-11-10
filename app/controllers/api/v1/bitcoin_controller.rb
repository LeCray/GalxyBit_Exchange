module Api
	module V1
		class BitcoinController < ApplicationController

			def new_btc_transaction
				#For Buying
				btcTransactionType  = params[:btcTransactionType]
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
							account_id: account_id,
							client_id: client_id
							).execute!		
				end
			
					render json: { 
						zar_balance: account_id,
						btc_balance: account_id
					}
			end


			def cancel_transaction
				amount 			  	= params[:amount]
				zar_transaction_id	= params[:zar_transaction_id]
				account_id 		  	= params[:account_id]
				client_id		  	= params[:client_id]

				zar_transaction = ::Accounts::CancelTransaction.new(
							account_id: account_id,
							client_id: client_id,
							zar_transaction_id: zar_transaction_id,
						).execute!

				render json: { 
					status: zar_transaction,
					zar_balance: account_id
				}
			end


		end
	end
end
