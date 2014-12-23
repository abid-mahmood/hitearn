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
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to homes_path, alert: "Successful Registration."
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
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path if session[:admin].present?
    else
      render "edit"
    end

  end

  def login
    @user = User.new
  end

  def show
  end

  def user_home
    if session[:current_user] && session[:password] || session[:admin]
      params[:user] = User.new
      params[:user][:email] = session[:current_user]
      params[:user][:password] = session[:password]
      params[:admin] = session[:admin]
    end

    if params[:user][:email] == 'abid' && params[:user][:password] == 'butt'
      session[:current_user] = params[:user][:email]
      session[:password] = params[:user][:password]
      session[:admin] = true
      true
    else
      false
      session[:current_user] = nil
      session[:admin] = false
      respond_to do |format|
        format.html { redirect_to homes_path, notice: "User doesn't exist, Invalid!" }
        format.js {  flash[:notice] = "User doesn't exist, Invalid!" }
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
    option = status ? false : true
    user.update_attribute(:activated, option)
    user.update_attribute(:activated_at, Time.now) if status == true
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
      :cnic
      )
  end
end
