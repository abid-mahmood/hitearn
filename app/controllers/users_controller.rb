class UsersController < ApplicationController
  before_filter :authorize, only: [:index, :reg_users, :unreg_users, :delete]
  after_filter :flash_to_headers

  def flash_to_headers
    return unless request.xhr?

    response.headers['X-Message'] = flash[:notice]
    
    flash.discard # don't want the flash to appear when you reload page
  end

  def new
    @user = User.new
    @fee = Amount.last.fixed_amount
  end

  def create
    @payment = Payment.new
    reference = params[:user][:referral_num]
    confirm_ref = User.where(:id => reference)
    @user = User.create(user_params)
    if @user.save
      pay = Payment.create(:user_id => @user.id, :fixed_amount => nil, :paid_at => nil)
      pay.save
      if reference.blank?
        redirect_to homes_path, alert: "Successful Registration."
      elsif confirm_ref.present?
        @user.update_attribute(:referral_num, reference)
        redirect_to homes_path, alert: "Successful Registration."
      elsif confirm_ref.blank?
        @user.errors.add(:referral_num, "Invalid Reference Number!")
        render "edit"
      end
    else
      render "new"
    end
  end

  def index
    @all_users = User.count
    @activated = User.where(:activated => true).count
    @inactive = User.where(:activated => false).count
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    reference = params[:user][:referral_num]
    confirm_ref = User.where(:id => reference)
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      if reference.blank?
        @user.update_attribute(:referral_num, reference)
        session[:admin].present? ? redirect_to(users_path) : redirect_to(homes_path, notice: "Successful")
      elsif confirm_ref.present?
        @user.update_attribute(:referral_num, reference)
        session[:admin].present? ? redirect_to(users_path) : redirect_to(homes_path, notice: "Successful")
      elsif confirm_ref.blank?
        @user.errors.add(:referral_num, "Invalid Reference Number!.")
        render "edit"
      end
    else
      render "edit"
    end

  end

  def login
    @user = User.new
  end

  def show
  end

  def user_panel
    @user = User.where(id: session[:current_user]).first.first_name
    @ads = Advertisement.where(:functional => true)
  end

  def user_home
    if session[:current_user] && session[:password] || session[:admin]
      params[:user] = User.new
      params[:user][:email] = session[:current_user]
      params[:user][:password] = session[:password]
      params[:admin] = session[:admin]
    end

    if (params[:user][:email] == 'abid' && params[:user][:password] == 'butt') || (params[:user][:email] == 'admin' && params[:user][:password] == 'rafayadmin')
      session[:current_user] = params[:user][:email]
      session[:password] = params[:user][:password]
      session[:admin] = true
      true
    else
      @user = User.where(:email => params[:user][:email], :password => params[:user][:password]).first
      if @user
        if @user.payments.first.status
          session[:admin] = false
          session[:current_user] = @user.id
          respond_to do |format|
            format.html { redirect_to user_panel_users_path, notice: 'Login Successful', method: :post }
          end
        elsif @user.activated.present?
          session[:admin] = false
          session[:current_user] = @user.id
          respond_to do |format|
            format.html { redirect_to user_panel_users_path, notice: 'Free Login Successful', method: :post }
          end
        else
          redirect_to homes_path, notice: "You are not activated Yet, Contact Admin."
        end
      else
        false
        session[:current_user] = nil
        session[:admin] = false
        respond_to do |format|
          format.html { redirect_to login_users_path, notice: "User doesn't exist, Invalid!" }
          format.js {  flash[:notice] = "User doesn't exist, Invalid!" }
        end
      end
    end
  end

  def reg_users
    @users = User.where(:activated => true)
    @all_users = @users.present? ? @users.count : 0
  end

  def unreg_users
    @users = User.where(:activated => false)
    @all_users = @users.present? ? @users.count : 0
  end

  def active_or_inactive
    user = User.where(id: params[:id]).first
    status = user.activated
    user.update_attribute(:activated_at, Time.now) if status == true
    user.payments.first.update_attributes(:status => true, :paid_at => Time.now)
    user.payments.first.update_attribute(:fixed_amount, Amount.last.fixed_amount)
    user.update_attribute(:free, false)
    redirect_to :back
  end

  def free_active
    user_id = params[:id]
    user = User.where(:id => user_id).first
    user.update_attribute(:activated, true)
    user.payments.first.update_attribute(:fixed_amount, nil)
    redirect_to :back
  end

  def inactive
    user_id = params[:id]
    user = User.where(:id => user_id).first
    user.payments.first.update_attribute(:status, false)
    user.update_attribute(:activated, false)
    redirect_to :back
  end

  def free_inactive
    user_id = params[:id]
    user = User.where(id: user_id).first
    user.update_attribute(:activated, false)
    redirect_to :back
  end

  def logout
    reset_session
    redirect_to homes_path
  end

  def delete
    @user = User.where(id: params[:id]).first
    @user.destroy
    redirect_to :back
  end

private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :contact_number,
      :password,
      :username,
      :cnic,
      :free
      )
  end
end
