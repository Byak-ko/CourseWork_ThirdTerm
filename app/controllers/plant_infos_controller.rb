class PlantInfosController < ApplicationController
  before_action :set_plant_info, only: [:edit, :update]

  def index
    @plant_infos = PlantInfo.order(:name)
    @current_member = current_member
  end

  def edit
    @plant_info = PlantInfo.find(params[:id])
  end

  def update
    @plant_info = PlantInfo.find(params[:id])
    if @plant_info.update(plant_info_params)
      redirect_to plant_infos_path
    else
      render :edit
    end
  end


   def new
    @plant_info = PlantInfo.new
  end


  def create
    @plant_info = PlantInfo.new(plant_info_params)

    if @plant_info.save
      redirect_to plant_infos_path
    else
      render :new
    end
  end

  def destroy
    @plant_info = PlantInfo.find(params[:id])
    @plant_info.destroy
    redirect_to plant_infos_path
  end

  private
    def set_plant_info
      @plant_info = PlantInfo.find(params[:id])
    end

    def plant_info_params
      params.require(:plant_info).permit(:name, :description, :optimal_growth_conditions, :image)
    end
end