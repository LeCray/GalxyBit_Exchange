class ZarTransactionsController < ApplicationController
	helper_method :current_client
	

	def new
		@zar_transactions = ZarTransaction.new

		@client = current_client	
		@account = current_client.account
		@zar_transactions = @account.zar_transactions.order('created_at DESC').paginate(page: params[:page], per_page: 6)

		@pending_zar_t = @zar_transactions.where(status: 'Pending').order('created_at DESC')

		@btc_value = Currency.where(currency_type: 'bitcoin').last.value
		@ltc_value = Currency.where(currency_type: 'litecoin').last.value
		@eth_value = Currency.where(currency_type: 'ethereum').last.value
	end

	def create
		@transaction = Transaction.new(params[:amount])
	end



end
