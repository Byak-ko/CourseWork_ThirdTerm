class ClubDocumentsController < ApplicationController
    def index
      @club_documents = ClubDocument.includes(:member).all
      @new_document = ClubDocument.new
    end
  
    def create
      @club_document = ClubDocument.new(club_document_params)
      @club_document.member_id = current_member.id 
  
      if @club_document.save
        redirect_to club_documents_path
      else
        render :new
      end
    end

    def show
        @club_document = ClubDocument.find(params[:id])
    end

    def destroy
      @club_document = ClubDocument.find(params[:id])
      @club_document.destroy
      redirect_to club_documents_path
    end
  
    private
  
    def club_document_params
      params.require(:club_document).permit(:document)
    end
  end
  