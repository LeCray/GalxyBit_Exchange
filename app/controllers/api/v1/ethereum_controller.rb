module Api
	module V1
		class EthereumController < ApplicationController

			def new_eth_transaction
				ethTransactionType  = params[:ethTransactionType]
				value  			    = params[:value]

				#For Buying
				zarSpendAmount 	  =	params[:zarSpendAmount]
				ethBuyAmount 	  = params[:ethBuyAmount]

				#For Selling
				zarRecieveAmount  =	params[:zarRecieveAmount]
				ethSellAmount 	  = params[:ethSellAmount]

				#Client Details
				account_id 		  = params[:account_id]
				client_id		  = params[:client_id]

				errors = ::Accounts::ValidateNewEthTransaction.new(
							zarSpendAmount: zarSpendAmount,
							ethSellAmount: ethSellAmount,
							ethTransactionType: ethTransactionType,
							account_id: account_id,
							client_id: client_id
					).execute!

				if errors.size > 0
					render json: { errors: errors }, status: 402
				else
					account = ::Accounts::PerformEthTransaction.new(
							#Buying
							zarSpendAmount: zarSpendAmount,
							ethBuyAmount: ethBuyAmount, 
							#Selling
							zarRecieveAmount: zarRecieveAmount,	
							ethSellAmount: ethSellAmount,

							ethTransactionType: ethTransactionType,
							value: value,
							account_id: account_id,
							client_id: client_id
							).execute!		
				end
			end


			def cancel_eth_transaction
			
				eth_transaction_id	= params[:eth_transaction_id]
				account_id 		  	= params[:account_id]
				client_id		  	= params[:client_id]

				eth_transaction = ::Accounts::CancelEthTransaction.new(
							account_id: account_id,
							client_id: client_id,
							eth_transaction_id: eth_transaction_id,	
						).execute!
			end
		end
	end
end
