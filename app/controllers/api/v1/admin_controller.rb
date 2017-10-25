module Api
	module V1
		class AdminController < ApplicationController


			def change_status
				account_id 		  = params[:account_id]
				client_id		  = params[:client_id]
				status 			  = params[:status]
				change_status_to  = params[:change_status_to]


				zar_transaction = ::Accounts::ChangeStatus.new(
							account_id: account_id,
							client_id: client_id,
							status: status,
							change_status_to: change_status_to,
						).execute!
				

				render json: { 
					status: zar_transaction.status
				}			

			end
		end
	end
end
