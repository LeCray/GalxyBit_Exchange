class ZarTransactionsController < ApplicationController
	helper_method :current_client

	def new
		@zar_transactions = ZarTransaction.new

		@client = current_client	
		@account = current_client.account

		@btc_value = Currency.where(currency_type: 'bitcoin').last.value
		@ltc_value = Currency.where(currency_type: 'litecoin').last.value
		@eth_value = Currency.where(currency_type: 'ethereum').last.value
	end

	def create
		@transaction = Transaction.new(params[:amount])
	end


end
