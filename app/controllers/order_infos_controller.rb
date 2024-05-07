class OrderInfosController < ApplicationController

  before_action :set_order_info, only: [:show, :update, :destroy]
  before_action :set_current_member, only: [:new, :create]

  def index
    @order_infos = OrderInfo.all
  end

  def show
  end

  def new
    @order_info = current_member.orders.new
  end

  def create
    @order_info = current_member.orders.build(order_info_params)

    if @order_info.save
      redirect_to @order_info
    else
      puts @order_info.errors.full_messages
      render :new
    end
  end

  def update
    @order_info = OrderInfo.find(params[:id])
    @order_info.update(buyer_id: current_member.id)
    redirect_back fallback_location: root_path
  end

  def destroy
    @order_info = OrderInfo.find(params[:id])
    @order_info.destroy
    redirect_to @order_info
  end

  private

  def set_order_info
    @order_info = OrderInfo.find(params[:id])
  end

  def set_current_member
    @current_member = current_member
  end

  def order_info_params
    params.require(:order_info).permit(:item_info_id, :price, :creator_id)
  end
end
