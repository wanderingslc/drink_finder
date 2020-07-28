class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  include SmartListing::Helper::ControllerExtensions 
  helper SmartListing::Helper 

  def index
    scope = Location.all 
    options = {}
    options = options.merge(query: params[:filter]) if params[:filter].present?
    options = options.merge(filters: params[:f]) if params[:f].present?
    scope = Location.all_with_filter(options, scope)
    if params[:locations_smart_listing] && params[:locations_smart_listing][:page].blank? 
      params[:locations_smart_listing][:page] = 1
    end
    @locations = smart_listing_create :locations, scope, partial: "locations/list"
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def csv_import
  end
  def import 
    Location.import(params[:file])
    redirect_to locations_new_path, notice: "Locations Imported"
  end

  def get_locations 
    locations = Location.all 
    render json: locations.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:license, :license_type, :name, :address, :phone, :latitude, :longitude, :beer, :wine, :liquor)
    end
end
