class AdminController < ApplicationController

	before_action :check_if_admin 

	def index
		@clients = Client.all
	end

	def show
		@client = Client.find(params[:id])
		@account = @client.account
		@zar_transactions = @account.zar_transactions.order('created_at DESC')
		
	end


private

	def check_if_admin
		if current_client.admin? != true
	    	redirect_to root_path, notice: "YOU'RE NOT ADMIN"
	  	end
	end


end
