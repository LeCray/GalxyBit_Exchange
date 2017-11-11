class AdminController < ApplicationController

	before_action :check_if_admin 

	def index
		@clients = Client.all.order('created_at')
	end

	def show
		@client = Client.find(params[:id])
		@account = @client.account

		@zar_transactions = @account.zar_transactions.order('created_at DESC').paginate(page: params[:page], per_page: 7)
		@btc_transactions = @account.btc_transactions.order('created_at DESC').paginate(page: params[:page], per_page: 7)
		@ltc_transactions = @account.ltc_transactions.order('created_at DESC').paginate(page: params[:page], per_page: 7)
		@eth_transactions = @account.eth_transactions.order('created_at DESC').paginate(page: params[:page], per_page: 7)
		
	end


private

	def check_if_admin
		if current_client.admin? != true
	    	redirect_to root_path, notice: "YOU'RE NOT ADMIN"
	  	end
	end


end
