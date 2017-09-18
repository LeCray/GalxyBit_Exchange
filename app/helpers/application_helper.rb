module ApplicationHelper

	def number_of_accounts
		Account.count
	end

	def number_of_clients
		Client.count
	end

	def flash_class(level)
	    case level
	        when :info then "alert alert-info"
	        when :success then "alert alert-success"
	        when :error then "alert alert-error"
	        when :alert then "alert alert-error"
    end

end

end
