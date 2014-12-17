class HomesController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end
end
