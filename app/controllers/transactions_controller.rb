class TransactionsController < ApplicationController
	helper_method :current_client
	

	def show
		@client = Client.find(params[:id])

		@btc_value = Currency.where(currency_type: 'bitcoin').last.value
		@ltc_value = Currency.where(currency_type: 'litecoin').last.value
		@eth_value = Currency.where(currency_type: 'ethereum').last.value

	end

	def new
		@transaction = Client.Transaction.new

		@client = current_client	

		@btc_value = Currency.where(currency_type: 'bitcoin').last.value
		@ltc_value = Currency.where(currency_type: 'litecoin').last.value
		@eth_value = Currency.where(currency_type: 'ethereum').last.value
	end

	def create
		@transaction = Transaction.new(params[:amount])

	end

	



end
