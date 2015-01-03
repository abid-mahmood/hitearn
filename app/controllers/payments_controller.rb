class PaymentsController < ApplicationController

  def pending
    @payments = Payment.where(:status => false)
  end

  def completed
    @payments = Payment.where(:status => true)
  end

  def index
    @payments = Payment.all
    @done_pays = completed.count
    @pending_pays = pending.count
    @users = User.all
    @amount = Amount.last.fixed_amount
  end

  def new
    @payment = Payment.new
  end

  def create
  end
  
end
