class AdvertisementsController < ApplicationController

  def new
    @adv = Advertisement.new
  end

  def create
    @adv = Advertisement.create(adv_params)
    if @adv.save
      redirect_to advertisements_path
    else
      render "new"
    end
  end

  def index
    @advs = Advertisement.all
  end

  def edit
    @adv = Advertisement.find(params[:id])
  end

  def update
    @adv = Advertisement.where(:id => params[:id]).first
    if @adv.update_attributes(adv_params)
      redirect_to advertisements_path
    else
      render "edit"
    end
  end

  def delete
    @adv = Advertisement.where(:id => params[:id]).first
    if @adv.destroy
      redirect_to advertisements_path, notice: "Advertisement has been deleted."
    else
      redirect_to advertisements_path, notice: "Advertisement cannot be deleted."
    end
  end

  def functional
    @advs = Advertisement.where(:functional => true)
  end

  def non_functional
    @advs = Advertisement.where(:functional => false)
  end


private
  def adv_params
    params.require(:advertisement).permit(
      :adv_name,
      :rate_per_click,
      :company,
      :functional,
      :link
      )
  end
end
