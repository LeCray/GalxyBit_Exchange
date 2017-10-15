class ClientsController < ApplicationController

	def index
		@clients = Client.all
	end

	def new
		@client = Client.new
	end


	def create
		@client = Client.new(client_params)
		@account = @client.build_account(client_id: @client.id, zar_balance: 0.00, btc_balance: 0.00, ltc_balance: 0.00, 
			eth_balance: 0.00)
		
		if @client.save && @account.save 
			ClientMailer.account_activation(@client).deliver_now
      		flash.now[:info] = "Awesome. Now swing over to your emails to activate your account :)"
      		render 'new'
		else
			render 'new'
		end
	end


	def show
		@client = Client.find(params[:id])


		c = @client.id
		@downlines = Client.where(referral_id: c) 


		@btc_value = Currency.where(currency_type: 'bitcoin').last.value
		@ltc_value = Currency.where(currency_type: 'litecoin').last.value
		@eth_value = Currency.where(currency_type: 'ethereum').last.value

	end 


	def edit
	end

	def update
	end

	def destroy
		@client = Client.find(params[:id])
		@client.destroy!
		@account = @client.account
		@account.destroy!
		redirect_to clients_path
		
	end


	


	private


	def client_params
		params.require(:client).permit(:first_name, :last_name, :email, :referral_id, :mt4_id,  :password, :password_confirmation)
	end



	def set_currencies(currency_type)
	    @currencies = Currency.where(currency_type: Currency.currency_types["#{currency_type}"])
	    @currencies.inject({}) do |new_element, current_element|
		    date = current_element.date
		    value = current_element.value
		    new_element[date] = value
		    new_element
	    end
	end

end
