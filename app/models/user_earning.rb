class UserEarning < ActiveRecord::Base

  scope :getEarning, ->(user) { where("user_id = ?", user).sum(:rate) }
end
