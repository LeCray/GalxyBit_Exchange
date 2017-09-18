class Account < ApplicationRecord
  belongs_to :client
  has_many :transactions

  validates :client, presence: true
  validates :balance, presence: true, numericality: true

  before_validation :load_defaults

  def load_defaults
  	if :balance.nil? 
  		self.balance = 0.00;
  	end
  end




end
