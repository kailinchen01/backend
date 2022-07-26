class ProfilePhotosController < ApplicationController
  before_action :set_profile_photo, only: %i[ show update destroy ]

  # GET /profile_photos
  # GET /profile_photos.json
  def index
    @profile_photos = ProfilePhoto.all

    render json: @profile_photos
  end

  # GET /profile_photos/1
  # GET /profile_photos/1.json
  def show
    render json: @profile_photo
  end

  # POST /profile_photos
  # POST /profile_photos.json
  def create
    @profile_photo = ProfilePhoto.new(profile_photo_params)

    if @profile_photo.save
      render json: @profile_photo, status: :created, location: @profile_photo
    else
      render json: @profile_photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profile_photos/1
  def update
    if @profile_photo.update(profile_photo_params)
      render json: @profile_photo
    else
      render json: @profile_photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profile_photos/1
  # DELETE /profile_photos/1.json
  def destroy
    @profile_photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_photo
      @profile_photo = ProfilePhoto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_photo_params
      params.require(:file)
      params[:owner_id] = params[:user_id]
      params[:owner_type] = params[:User]
      params.permit(:file, :user_id, :owner_type, :owner_id)
    end
end
