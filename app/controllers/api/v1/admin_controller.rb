module Api
	module V1
		class AdminController < ApplicationController


			def change_status
				account_id 		  		= params[:account_id]
				client_id		  		= params[:client_id]
				change_status_to  		= params[:change_status_to]
				zar_transaction_id	 	= params[:zar_transaction_id]


				zar_transaction = ::Accounts::ChangeStatus.new(
							account_id: account_id,
							client_id: client_id,
							change_status_to: change_status_to,
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
