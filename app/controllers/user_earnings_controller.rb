class UserEarningsController < ApplicationController

  def create_earning
    adv_id = params[:id]
    user = session[:current_user]
    user_info = session[:admin].present? ? User.where(:email => user).first : User.where(:id => user).first
    user_id = user_info.id
    adv_price = Advertisement.where(:id => adv_id).first.rate_per_click
    @earn = UserEarning.create(
      :user_id => user_id,
      :adv_id => adv_id,
      :rate => adv_price
      )
    respond_to do |format|
      if @earn.save
        format.js { redirect_to user_panel_users_path, notice: "Ad Viewed Successful." }
        format.html { redirect_to user_panel_users_path, notice: "Ad Viewed Successful." }
      else
        format.html { redirect_to user_panel_users_path, notice: "Try again later please." }
        format.js { redirect_to user_panel_users_path, notice: "Try again later please!"  }
      end
    end
  end

  def index
    UserEarning.all
  end
end
