module Api
	module V1
		class AdminController < ApplicationController


			def change_status
				account_id 		  = params[:account_id]
				client_id		  = params[:client_id]
				status 			  = params[:status]


					










=begin
				account = ::Accounts::PerformTransaction.new(
							amount: amount,
							transaction_type: transaction_type,
							account_id: account_id,
							client_id: client_id
						).execute!
				

				render json: { 
					zar_balance: account.zar_balance 

				}
=end			

			end
		end
	end
end
