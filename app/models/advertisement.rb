class Advertisement < ActiveRecord::Base
  validates_presence_of :adv_name, message: "Advertisement Name must be present!"
  validates_presence_of :rate_per_click, message: "Rate must be decided!"
  validates_numericality_of :rate_per_click, message: "Only Number Allowed!"
end
