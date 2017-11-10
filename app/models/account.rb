class Account < ApplicationRecord
  belongs_to :client, optional: true
  has_many :zar_transactions
  has_many :btc_transactions
  has_many :ltc_transactions
  has_many :eth_transactions

  validates :client, presence: true
  validates :zar_balance, presence: true, numericality: true
  validates :btc_balance, presence: true, numericality: true
  validates :ltc_balance, presence: true, numericality: true
  validates :eth_balance, presence: true, numericality: true

  before_validation :load_defaults

  def load_defaults
  	if zar_balance.nil?
  		self.zar_balance = 0.00;
      self.btc_balance = 0.00;    
      self.ltc_balance = 0.00;    
      self.eth_balance = 0.00;    
    end
  end
end
