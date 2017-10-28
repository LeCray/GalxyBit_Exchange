class EthTransaction < ApplicationRecord
	belongs_to :account
  	belongs_to :client, optional: true

   	TRANSACTION_TYPES = ["Buy", "Sell"]
    STATUS_TYPES = ["Approved", "Cancelled"]

  	validates :account, presence: true
  	validates :amount, presence: true, numericality: true
  	validates :transaction_type, presence: true, inclusion: {in: TRANSACTION_TYPES}
  	validates :transaction_number, presence: true#, uniqueness: true
    validates :status, presence: true


  	before_validation :load_defaults

  	def load_defaults
  		if self.new_record?
  			self.transaction_number = SecureRandom.uuid
        self.status = 'Pending'
  		end
  	end
end
