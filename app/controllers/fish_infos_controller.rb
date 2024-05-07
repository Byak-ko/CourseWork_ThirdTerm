class FishInfosController < ApplicationController
  before_action :set_fish_info, only: [:edit, :update,]
  def index
    @fish_infos = FishInfo.order(:name)
    @current_member = current_member
  end

  def edit
    @fish_info = FishInfo.find(params[:id])
  end

  def update
    @fish_info = FishInfo.find(params[:id])
    if @fish_info.update(fish_info_params)
      redirect_to fish_infos_path
    else
      render :edit
    end
  end

  def new
    @fish_info = FishInfo.new
  end

  def create
    @fish_info = FishInfo.new(fish_info_params)

    if @fish_info.save
      redirect_to @fish_info
    else
      render :new
    end
  end

  private
    def set_fish_info
      @fish_info = FishInfo.find(params[:id])
    end

    def fish_info_params
      params.require(:fish_info).permit(:name, :description, :features, :image)
    end
end