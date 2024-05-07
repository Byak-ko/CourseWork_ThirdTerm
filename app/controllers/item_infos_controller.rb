class ItemInfosController < ApplicationController

    def index
      @item_infos = if params[:category].present?
        ItemInfo.where(category: params[:category])
      else
        ItemInfo.all
      end
        @current_member = current_member
    end
  
    def show
        @item_info = ItemInfo.find(params[:id])
    end

    def new
        @item_info = ItemInfo.new
        @item_infos = ItemInfo.all
    end

    def edit
      @item_info = ItemInfo.find(params[:id])
    end

    def update
      @item_info = ItemInfo.find(params[:id])
      if @item_info.update(item_info_params)
        redirect_to item_infos_path
      else
        render :edit
      end
    end

    def create
        @item_info = ItemInfo.new(item_info_params)
        if @item_info.save
          redirect_to item_info_path(@item_info)
        else
          render :new
        end
    end
    
      private
    
      def item_info_params
        params.require(:item_info).permit(:name, :description, :category, :image)
      end


  end
  