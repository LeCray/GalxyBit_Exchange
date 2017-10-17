class TransactionController < ApplicationController
	

	def show
		@client = Client.find(params[:id])

		@btc_value = Currency.where(currency_type: 'bitcoin').last.value
		@ltc_value = Currency.where(currency_type: 'litecoin').last.value
		@eth_value = Currency.where(currency_type: 'ethereum').last.value

	end

	def new
		@transactions = Transaction.new(params[:amount])

		@client = current_client	

		@btc_value = Currency.where(currency_type: 'bitcoin').last.value
		@ltc_value = Currency.where(currency_type: 'litecoin').last.value
		@eth_value = Currency.where(currency_type: 'ethereum').last.value

	end

	



end
