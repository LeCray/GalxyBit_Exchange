module Api
	module V1
		class AccountsController < ApplicationController


			def new_transaction
				amount 			  = params[:amount]
				transaction_type  = params[:transaction_type]
				account_id 		  = params[:account_id]
				client_id		  = params[:client_id]

				errors = ::Accounts::ValidateNewTransaction.new(
							amount: amount,
							transaction_type: transaction_type,
							account_id: account_id,
							client_id: client_id
					).execute!

				if errors.size > 0
					render json: { errors: errors }, status: 402
				else
					account = ::Accounts::PerformTransaction.new(
								amount: amount,
								transaction_type: transaction_type,
								account_id: account_id,
								client_id: client_id
							).execute!		
				end
			
					render json: { 
						zar_balance: account.zar_balance 
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
