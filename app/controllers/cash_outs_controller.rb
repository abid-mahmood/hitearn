class CashOutsController < ApplicationController

  before_filter :authorize, only: [:index, :active_request]
  before_filter :check_user, only: [:create, :new]

  def index
    @cash = CashOut.all
  end

  def new
    user_cash = User.where(:id => session[:current_user]).first
    @cash = user_cash.cash_outs.present? ? user_cash.cash_outs : nil
    @request = CashOut.new
    @total = UserEarning.where(:user_id => session[:current_user]).sum(:rate)
    cash_out_any = CashOut.where(:user_id => session[:current_user]).sum(:cash_out_amount) if @total.to_f > 0
    @earned_money = (@total.to_f > 0.0) ? (@total.to_f - cash_out_any.to_f).round(2) : 0.0
  end

  def active_request
    request = params[:id]
    @status = CashOut.where(id: request).first
    @status.update_attribute(:completed, true)
    redirect_to :back
  end

  def create
    if params[:cash_out][:cash_out_amount].blank? || params[:cash_out][:cash_out_amount].to_f < 0
      session[:error] = "Please Enter Valid Amount!"
      redirect_to new_cash_out_path
    else
      @earned_money = UserEarning.where(:user_id => session[:current_user]).sum(:rate)
      requested_amount = CashOut.where(:user_id => session[:current_user]).sum(:cash_out_amount).to_f + params[:cash_out][:cash_out_amount].to_f
      if @earned_money.to_f > 0.0
        if requested_amount.to_f > @earned_money.to_f
          session[:error] = "Withdraw request exceeds your earned money."
          redirect_to new_cash_out_path
        else
          @request = CashOut.create(:user_id => session[:current_user], :cash_out_amount => params[:cash_out][:cash_out_amount])
          if @request.save
            session[:error] = ''
            redirect_to user_panel_users_path, notice: "Request Submitted Successfully."
          else
            render "new"
          end
        end
      else
        session[:error] = "Withdraw request exceeds your earned money."
        redirect_to new_cash_out_path
      end
    end
  end
end
