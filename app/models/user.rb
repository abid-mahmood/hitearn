class User < ActiveRecord::Base
  validates_presence_of :first_name, message: "First name is mandatory"
  validates_presence_of :last_name, message: "Last name is mandatory"
  validates_presence_of :email, message: "Email is mandatory"
  validates_presence_of :password, message: "Password is mandatory"
  validates_presence_of :contact_number, message: "Contact Number is mandatory"
  validates_presence_of :cnic, message: "CNIC is mandatory"
  validates_numericality_of :contact_number, message: "Contact Number must be digits"
  validates_numericality_of :cnic, :only_integer => true, message: "CNIC must be digits"
  validates_length_of :cnic, maximum: 13, message: "CNIC Digits limit exceeds."
  validates_uniqueness_of :email, message: "Email already taken."
  validates_uniqueness_of :username, message: "Username already taken."
  validates_length_of :username, maximum: 12, message: "Only 13 characters allowed for username."
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Invalid email format"

  scope :getName, ->(referral_id) { where("id = ?", referral_id).first }

  has_many :payments
  has_many :cash_outs
  
end
