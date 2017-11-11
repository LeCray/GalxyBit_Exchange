module Api
	module V1
		class AdminController < ApplicationController


			def change_status
				account_id 		  		= params[:account_id]
				client_id		  		= params[:client_id]
				change_status_to  		= params[:change_status_to]
				zar_transaction_id	 	= params[:zar_transaction_id]
				btc_transaction_id	 	= params[:btc_transaction_id]
				ltc_transaction_id	 	= params[:ltc_transaction_id]
				eth_transaction_id	 	= params[:eth_transaction_id]


				if zar_transaction_id != "0" 
					zar_transaction = ::Accounts::ChangeZarStatus.new(
								account_id: account_id,
								client_id: client_id,
								change_status_to: change_status_to,
								zar_transaction_id: zar_transaction_id,
							).execute!
					render json: { 
						status: zar_transaction,
						zar_balance: account_id
					}	

				elsif btc_transaction_id != "0"
					btc_transaction = ::Accounts::ChangeBtcStatus.new(
								account_id: account_id,
								client_id: client_id,
								change_status_to: change_status_to,
								btc_transaction_id: btc_transaction_id,
							).execute!
					render json: { 
						status: btc_transaction,
						btc_balance: account_id
					}

				elsif ltc_transaction_id != "0"
					ltc_transaction = ::Accounts::ChangeLtcStatus.new(
								account_id: account_id,
								client_id: client_id,
								change_status_to: change_status_to,
								ltc_transaction_id: ltc_transaction_id,
							).execute!
					render json: { 
						status: ltc_transaction,
						ltc_balance: account_id
					}

				elsif eth_transaction_id != "0"
					eth_transaction = ::Accounts::ChangeEthStatus.new(
								account_id: account_id,
								client_id: client_id,
								change_status_to: change_status_to,
								eth_transaction_id: eth_transaction_id,
							).execute!
					render json: { 
						status: eth_transaction,
						eth_balance: account_id
					}
				end				

			end
		end
	end
end
