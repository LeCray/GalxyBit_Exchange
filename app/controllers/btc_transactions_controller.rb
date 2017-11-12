class BtcTransactionsController < ApplicationController
	helper_method :current_client
	

	def new
		@btc_transactions = BtcTransaction.new

		@client = current_client	
		@account = current_client.account
		@btc_transactions = @account.btc_transactions.order('created_at DESC').paginate(page: params[:page], per_page: 6)

		@pending_btc_t = @btc_transactions.where(status: 'Pending').order('created_at DESC')

		@btc_value = Currency.where(currency_type: 'bitcoin').last.value
		@ltc_value = Currency.where(currency_type: 'litecoin').last.value
		@eth_value = Currency.where(currency_type: 'ethereum').last.value
	end

	def create
		@transaction = Transaction.new(params[:amount])
	end
end
