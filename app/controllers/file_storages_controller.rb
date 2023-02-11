require 'rack/mime'
class FileStoragesController < ApplicationController
  before_action :check_login_user!
  def index
    if params[:id].present?
      @file_storages = FileStorage.where(id: params[:id])
    else
      @file_storages = FileStorage.all
    end
  end

  def new
    @file_storage = FileStorage.new
  end

  def create
    @file_storage = FileStorage.new(file_storage_params)
    if @file_storage.save
      redirect_to file_storages_path, notice: 'Successfully uploaded.'
    else
      render :new
    end
  end

  def destroy
    @file_storage=FileStorage.find(params[:id])
    if current_user == @file_storage.user
      @file_storage.destroy
      redirect_to file_storages_path, notice: 'Successfully deleted.'
    else 
      redirect_to file_storages_path, notice: 'You are not the author. Please try again.'   
    end
  end
    

  def download
    @file_storage = FileStorage.find(params[:id])
    extension = Rack::Mime::MIME_TYPES.invert[@file_storage.attachment.content_type]
    send_file @file_storage.attachment.path, :type => @file_storage.attachment.content_type, :filename => @file_storage.name+"#{extension}", :disposition => 'attachment'
  end

  private   
  def file_storage_params   
    params.require(:file_storage).permit(:name, :attachment, :user_id)   
  end   
end
