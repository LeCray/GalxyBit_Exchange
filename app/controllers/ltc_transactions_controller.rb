class LtcTransactionsController < ApplicationController
	helper_method :current_client
	

	def new
		@ltc_transactions = LtcTransaction.new

		@client = current_client	
		@account = current_client.account
		@ltc_transactions = @account.ltc_transactions.order('created_at DESC').paginate(page: params[:page], per_page: 6)

		@pending_ltc_t = @ltc_transactions.where(status: 'Pending').order('created_at DESC')

		@btc_value = Currency.where(currency_type: 'bitcoin').last.value
		@ltc_value = Currency.where(currency_type: 'litecoin').last.value
		@eth_value = Currency.where(currency_type: 'ethereum').last.value
	end

	def create
		@transaction = Transaction.new(params[:amount])
	end
end
