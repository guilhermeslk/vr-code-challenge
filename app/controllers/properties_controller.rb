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

  private

  def property_params
    params.require(:property).permit(:x, :y, :title, :price, :description,
                                     :beds, :baths, :square_meters)
  end
end
