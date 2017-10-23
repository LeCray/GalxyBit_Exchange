class AdminController < ApplicationController

	before_action :check_if_admin 

	def index
		@clients = Client.all
	end

	def show
	end


private

	def check_if_admin
		if current_client.admin? != true
	    	redirect_to root_path, notice: "YOU'RE NOT ADMIN"
	  	end
	end


end
