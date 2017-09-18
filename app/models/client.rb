class Client < ApplicationRecord
	attr_accessor :remember_token, :activation_token
	before_save   :downcase_email
	before_create :create_activation_digest, :admin_default

	has_one :account
	has_secure_password

	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :referral_id, presence: true
	

	before_save :format_name
	
	def to_s
		"#{first_name} #{last_name}"
	end

	def format_name
		self.first_name = self.first_name.capitalize
		self.last_name = self.last_name.capitalize
	end


	 # Returns true if the given token matches the digest.
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	private

	# You're not admin by default
	def admin_default
		if admin.nil?
			admin = false
		end
	end

    # Converts email to all lower-case.
  	def downcase_email
		self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
		self.activation_token  = Client.new_token
		self.activation_digest = Client.digest(activation_token)
    end

    # Returns the hash digest of the given string.
	def Client.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		                                          BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

     # Returns a random token.
	def Client.new_token
		SecureRandom.urlsafe_base64
	end

	

		 	


end
