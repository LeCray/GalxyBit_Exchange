module Api
	module V1
		class LitecoinController < ApplicationController

			def new_ltc_transaction
				#For Buying
				ltcTransactionType  = params[:ltcTransactionType]
				zarSpendAmount 	  =	params[:zarSpendAmount]
				ltcBuyAmount 	  = params[:ltcBuyAmount]

				#For Selling
				zarRecieveAmount  =	params[:zarRecieveAmount]
				ltcSellAmount 	  = params[:ltcSellAmount]

				#Client Details
				account_id 		  = params[:account_id]
				client_id		  = params[:client_id]

				errors = ::Accounts::ValidateNewLtcTransaction.new(
							zarSpendAmount: zarSpendAmount,
							ltcSellAmount: ltcSellAmount,
							ltcTransactionType: ltcTransactionType,
							account_id: account_id,
							client_id: client_id
					).execute!

				if errors.size > 0
					render json: { errors: errors }, status: 402
				else
					account = ::Accounts::PerformLtcTransaction.new(
							#Buying
							zarSpendAmount: zarSpendAmount,
							ltcBuyAmount: ltcBuyAmount, 
							#Selling
							zarRecieveAmount: zarRecieveAmount,	
							ltcSellAmount: ltcSellAmount,

							ltcTransactionType: ltcTransactionType,
							account_id: account_id,
							client_id: client_id
							).execute!		
				end
			end


			def cancel_ltc_transaction
			
				ltc_transaction_id	= params[:ltc_transaction_id]
				account_id 		  	= params[:account_id]
				client_id		  	= params[:client_id]

				ltc_transaction = ::Accounts::CancelLtcTransaction.new(
							account_id: account_id,
							client_id: client_id,
							ltc_transaction_id: ltc_transaction_id,	
						).execute!
			end
		end
	end
end
