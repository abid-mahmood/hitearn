class CashOut < ActiveRecord::Base
  validates_numericality_of :cash_out_amount, :greater_than => 0.0, message: "Invalid Withdrawl Amount!"
  belongs_to :user
end
