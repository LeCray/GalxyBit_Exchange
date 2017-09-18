class ClientsController < ApplicationController

	def index
		@clients = Client.all
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		@account = @client.build_account(client_id: @client.id, balance: 0.00)
		
		if @client.save && @account.save 
			#ClientMailer.account_activation(@client).deliver_now
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


	end

	def call
		@client = Client.find(params[:id])
	  	#ClientMailer.call_request(@client).deliver_now
	  	flash[:info] = "Your call request has been sent. Please wait while we process it :)"
	    redirect_to client_path(@client)
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

end
