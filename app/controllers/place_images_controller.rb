class PlaceImagesController < ApplicationController
  before_action :set_image, only: %i[ show update destroy ]

  # GET /place_images
  def index
    @place_images = PlaceImage.all

    render json: @place_images
  end

  # GET /place_images/1
  def show
    render json: @place_image
  end

  # POST /place_images
  def create
    @place_image = PlaceImage.new(image_params)
    if @place_image.save
      render json: @place_image, status: :created, location: @place_image
    else
      render json: @place_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /place_images/1
  def update
    if @place_image.update(image_params)
      render json: @place_image
    else
      render json: @place_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /place_images/1
  def destroy
    @place_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @place_image = PlaceImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:file)
      params[:owner_type] = :Report
      params[:owner_id] = params[:report_id]
      params.permit(:user_id, :owner_id, :owner_type, :file)
    end
end
