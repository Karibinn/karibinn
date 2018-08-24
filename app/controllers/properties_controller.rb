# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
  end

  def show
    @product = Product.friendly.find(params[:id])

    return render(:not_found) unless @product.property?

    @property = Property.eager_load(
      :property_type, :equipments, :property_services
    ).find_by(id: @product.specific_id)
  end
end
