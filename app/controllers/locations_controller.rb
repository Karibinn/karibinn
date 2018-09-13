# frozen_string_literal: true

class LocationsController < ApplicationController
  def index
    @locations = Location.all

    @property_products = Product.properties.eager_load(:category, :images).page(params[:page])
  end

  def show
    @location = Location.friendly.find(params[:id])

    @property_products = @location.products.properties.eager_load(:category, :images).page(params[:page])
  end
end
