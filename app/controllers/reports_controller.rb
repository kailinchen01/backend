class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show update destroy ]
  before_action :get_reports, only: %i[ index ]

  # GET /reports
  def index
    render json: @reports.order(:created_at).reverse_order
  end

  # GET /reports/1
  def show
    render json: @report
  end

  # POST /reports
  def create
    lonlat = report_params[:lonlat]

    if Marker.exists?(lonlat: lonlat)
      puts "Use Existing Marker"
      new_report = Report.new(report_params)
      new_report.marker = Marker.find_by(lonlat: lonlat)
      success = new_report.save
      new_entry = new_report
    else
      puts "Create New Marker"
      new_marker = Marker.new(lonlat: lonlat, place_name: report_params[:place_name])
      new_marker.reports.build(report_params)
      success = new_marker.save
      new_entry = new_marker
    end

    if success
      render json: new_entry, status: :created, location: new_entry
    else
      render json: new_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:user_id, :category, :marker_id, :lonlat, :description, :place_name, place_image_ids: [])
    end

  # get reports belonging to the marker
  def get_reports
    @reports = Marker.find(params[:marker_id]).reports
  end
end


