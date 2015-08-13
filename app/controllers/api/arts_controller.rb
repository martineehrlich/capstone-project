class Api::ArtsController < ApplicationController
  def index
    @arts = Art.all
    render json: @arts
  end

  def new
    @art = Art.new
    render json: @art
  end

  def create
    @art = Art.new(art_params)
    @art.artist_id = current_user.id
    if @art.save
      render :show
    else
      flash.now[:errors] = @art.errors.full_messages
      render :show
    end
  end

  def show
    @art = Art.find(params[:id])
    @artist = @art.artist
    render :show
  end

  private
  def art_params
    params.require(:art).permit(:artist_id, :title, :description, :image_file_name)
  end
end
