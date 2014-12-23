class AmountsController < ApplicationController
  def new
    check_amount = Amount.last
    @old_amount = check_amount.fixed_amount if check_amount.present?
    @amount = Amount.new
  end

  def create
    @amount = Amount.last
    if @amount.present?
      payment = @amount.update_attribute(:fixed_amount, (params[:amount][:fixed_amount].present? ? params[:amount][:fixed_amount] : 0))
      binding.pry
      redirect_to payments_path, notice: "Amount has been Set!!"
    else
      payment = Amount.create(:fixed_amount => (params[:amount][:fixed_amount].present? ? params[:amount][:fixed_amount] : 0 ))
      if payment.save
        redirect_to payments_path, notice: "Amount has been Set!!"
      else
        render 'new'
      end
    end
  end
end
