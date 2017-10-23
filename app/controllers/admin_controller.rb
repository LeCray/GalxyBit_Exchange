class AdminController < ApplicationController

	def index
		@clients = Clients.all
	end

	def show
	end
	

end
