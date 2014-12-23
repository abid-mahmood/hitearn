class PaymentsController < ApplicationController

  def pending
    @payments = Payment.where(:status => false)
  end

  def completed
    @payments = Payment.where(:status => true)
  end

  def index
    @payments = Payment.all
    @done_pays = completed
    @pending_pays = pending
    @users = User.all
    @amount = Amount.last.fixed_amount
  end

  def new
    @payment = Payment.new
  end

  def create
    @amount = Amount.new
    @payment = @amount.create(:fixed_amount => params[:fixed_amount])

    if @payment.save

      redirect_to payments_path, notice: "New Payment has been set!"
    else
      render "new"
    end
  end
end
