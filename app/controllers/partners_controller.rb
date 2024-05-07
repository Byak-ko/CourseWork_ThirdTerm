class PartnersController < ApplicationController
  before_action :set_partner, only: [:edit, :update, :destroy]

  def index
    @partners = Partner.all
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      redirect_to partners_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @partner.update(partner_params)
      redirect_to partners_path
    else
      render :edit
    end
  end

  def destroy
    @partner.destroy
    redirect_to partners_path
  end

  private

  def set_partner
    @partner = Partner.find(params[:id])
  end

  def partner_params
    params.require(:partner).permit(:name, :email, :phone)
  end

end