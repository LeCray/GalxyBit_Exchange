class ClientsController < ApplicationController

	before_action :only_see_own_page, only: :show 
	


	def index
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



		@bitcoin_chart = 'bitcoin'
		@bitcoin = 'BITCOIN'

		case @bitcoin_chart
	    when  !Currency.currency_types.include?(@bitcoin_chart) 
	      @bitcoin_chart = {}
	    else
	      @bitcoin_chart = set_bitcoin_chart(@bitcoin_chart)
	    end

		

		@ethereum_chart = 'ethereum'
		@ethereum = 'ETHEREUM'

		case @ethereum_chart
	    when  !Currency.currency_types.include?(@ethereum_chart) 
	      @ethereum_chart = {}
	    else
	      @ethereum_chart = set_ethereum_chart(@ethereum_chart)
	    end

		

		@litecoin_chart = 'litecoin'
		@litecoin = 'LITECOIN'

		case @litecoin_chart
	    when  !Currency.currency_types.include?(@litecoin_chart) 
	      @litecoin_chart = {}
	    else
	      @litecoin_chart = set_litecoin_chart(@litecoin_chart)
	    end

	

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
		params.require(:client).permit(:first_name, :last_name, :email, :referral_id, :password, :password_confirmation)
	end


	def only_see_own_page
	  @client = Client.find(params[:id])

	  if current_client != @client 
	    redirect_to root_path, notice: "YOU THINK I'M DUMB HUH? THIS SYSTEM'S GOT TOO MUCH SAUCE FAM"
	  end


	end





	def set_bitcoin_chart(currency_type)
	    @bitcoin_chart = Currency.where(currency_type: Currency.currency_types["bitcoin"])
	    @bitcoin_chart.inject({}) do |new_element, current_element|
		    date = current_element.date
		    value = current_element.value
		    new_element[date] = value
		    new_element
	    end
	end

	def set_ethereum_chart(currency_type)
	    @ethereum_chart = Currency.where(currency_type: Currency.currency_types["ethereum"])
	    @ethereum_chart.inject({}) do |new_element, current_element|
		    date = current_element.date
		    value = current_element.value
		    new_element[date] = value
		    new_element
	    end
	end

	def set_litecoin_chart(currency_type)
		    @litecoin_chart = Currency.where(currency_type: Currency.currency_types["litecoin"])
		    @litecoin_chart.inject({}) do |new_element, current_element|
			    date = current_element.date
			    value = current_element.value
			    new_element[date] = value
			    new_element
		    end
		end




end
