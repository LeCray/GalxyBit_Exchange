module Accounts
	class ChangeStatus

		def initialize(account_id:, client_id:, change_status_to:, zar_transaction_id:)
			@account_id 	   		= account_id
			@client_id 		   		= client_id
			@change_status_to  	    = change_status_to
			@zar_transaction_id     = zar_transaction_id
			@account                = Account.where(id: @account_id).first
			@zar_transaction        = ZarTransaction.where(id: @zar_transaction_id).first
		end

		def execute!
			ActiveRecord::Base.transaction do


				if @change_status_to == 'Approved'
					@zar_transaction.update!(status: @change_status_to)
				elsif @change_status_to == 'Cancelled'
					@zar_transaction.update!(status: @change_status_to)				
				end

			end
			@zar_transaction
		end
	end
end
