class DeceasedPostsController < ApplicationController
  before_action :set_deceased_post, only: %i[ show update destroy ]

  # GET /deceased_posts
  def index
    _start = params[:start].to_i
    _end = params[:end].to_i
    offset = _start > 0 ? _start - 1 : 0
    limit = _end >= _start ? _end - _start + 1 : 20
    puts offset
    puts limit
    #attributes :id, :name, :gender, :age, :date_of_birth, :date_found, :vague_location, :hair_length, :hair_color, :skin_color, :description, :posting_time, :ethnicity, :age_range, :lat, :lng, :ethnicity
 
    if params[:search_age, :search_gender, :search_location, :search_skincolour, :search_hairlength,
       :search_haircolour]
      @deceased_posts= DeceasedPost.where(gender: params[:search_gender],
         age: params[:search_age], 
         location: params[:search_location], 
         hair_color: params[:search_haircolour], hair_length: params[:search_hairlength], skin_color: params[:search_skincolour] )
    else
      @deceased_posts = DeceasedPost.order(created_at: :desc).offset(offset).limit(limit)
    end
    def params[:searchDate]
      @deceased_post=DeceasedPost.where(date_found: params[:searchDate.parse])
    end
    render json: @deceased_posts
  end

  # GET /deceased_posts/1
  def show
    render json: @deceased_post
  end

  # POST /deceased_posts
  def create
    @deceased_post = DeceasedPost.new(deceased_post_params)

    if @deceased_post.save!
      puts "permitted params"
      p deceased_post_params
      puts "deceased_post"
      p @deceased_post
      render json: @deceased_post, status: :created, location: @deceased_post
    else
      render json: @deceased_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deceased_posts/1
  def update
    if @deceased_post.update(deceased_post_params)
      render json: @deceased_post
    else
      render json: @deceased_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deceased_posts/1
  def destroy
    @deceased_post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deceased_post
    @deceased_post = DeceasedPost.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deceased_post_params
    result = params.require(:deceased_post)
                   .permit(:user_id, :name, :gender, :age, :date_of_birth, :date_found, :location, :vague_location, :hair_length, :hair_color, :skin_color, :description, :age_range, :lat, :lng, :ethnicity, deceased_image_ids: [])
    # result[:deceased_image_ids] = params[:deceased_image_ids]
    result
  end
end
