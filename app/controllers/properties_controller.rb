class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  # POST /properties
  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @property, status: :success
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:x, :y, :title, :price, :description,
                                     :beds, :baths, :square_meters)
  end
end
