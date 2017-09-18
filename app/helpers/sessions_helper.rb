module SessionsHelper

	# Logs in the given client.
	def log_in(client)
		session[:client_id] = client.id
	end

	# Logs out the current client.
	def log_out
		session.delete(:client_id)
		@current_client = nil
	end

	# Returns the current logged-in client (if any).
	def current_client
		if (client_id = session[:client_id])
			@current_client ||= Client.find_by(id: client_id)
		end
	end
  

   # Returns true if the client is logged in, false otherwise.	
	def logged_in?
		!current_client.nil?
	end

end
