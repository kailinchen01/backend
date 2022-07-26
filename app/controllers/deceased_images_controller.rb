class DeceasedImagesController < ApplicationController
  before_action :set_image, only: %i[ show update destroy ]

  # GET /deceased_images
  def index
    @deceased_images = DeceasedImage.all

    render json: @deceased_images
  end

  # GET /deceased_images/1
  def show
    render json: @deceased_image
  end

  # POST /deceased_images
  def create
    @deceased_image = DeceasedImage.new(image_params)

    if @deceased_image.save
      render json: @deceased_image, status: :created, location: @deceased_image
    else
      render json: @deceased_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deceased_images/1
  def update
    if @deceased_image.update(image_params)
      render json: @deceased_image
    else
      render json: @deceased_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deceased_images/1
  def destroy
    @deceased_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @deceased_image = DeceasedImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:file)
      params[:owner_type] = :DeceasedPost
      params[:owner_id] = params[:deceased_post_id]
      params.permit(:owner_id, :owner_type, :user_id, :file)
    end
end
