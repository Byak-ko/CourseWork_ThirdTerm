class MembersController < ApplicationController
    before_action :set_member, only: [:show, :edit, :update, :destroy]
    
    def index
      @members = Member.all
      set_current_user
    end
  
    
    def show
      @member = Member.find(params[:id])
 
    end
  
    
    def new
      @member = Member.new
    end
  
    
    def edit
      @member = Member.find(params[:id])
      set_current_user
    end
  
    
  
    
    def update
      if @member.update(member_params)
        redirect_to members_path
      else
        render :edit
      end
    end
  
    
    def destroy
        @member = Member.find(params[:id])
        @member.destroy
        redirect_to @member
    end
  
    private
      
      def set_current_user
        @current_user = current_member
      end

      def set_member
        @member = Member.find(params[:id])
      end
      
      def member_params
        params.require(:member).permit(:first_name, :last_name, :address, :email, :phone, :joined_date, :role)
      end
  end
