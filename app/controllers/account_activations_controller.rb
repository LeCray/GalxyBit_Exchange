class AccountActivationsController < ApplicationController

	def edit
		client = Client.find_by(email: params[:email])
		if client && !client.activated? && client.authenticated?(:activation, params[:id])
			client.update_attribute(:activated,    true)
			client.update_attribute(:activated_at, Time.zone.now)
			log_in client
			flash[:success] = "Your account is now active."
			redirect_to client
		else
		flash[:danger] = "Invalid activation link"
		redirect_to new_client_path
		end
	end

end
