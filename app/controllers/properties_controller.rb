class PropertiesController < ApplicationController
  # POST /properties
  def create
    @property = Property.new(property_params)
    @property.save

    respond_with @property, location: @property, status: :created
  end

  def show
    @property = Property.find(params[:id])
    respond_with @property, location: @property
  end

  def index
    @properties = properties_by_region_coordinates_query(params).perform

    respond_with @properties, location: properties_url
  end

  private

  def property_params
    params.require(:property).permit(:x, :y, :title, :price, :description,
                                     :beds, :baths, :square_meters)
  end

  # @param params [Hash]
  # @return [PropertiesByRegionCoordinatesQuery]
  def properties_by_region_coordinates_query(params)
    PropertiesByRegionCoordinatesQuery.new(
      ax: params[:ax],
      ay: params[:ay],
      bx: params[:bx],
      by: params[:by]
    )
  end
end
