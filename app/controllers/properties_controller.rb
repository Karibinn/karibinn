# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    @products = Product
                    .properties
                    .eager_load(:category, :images)
                    .page(params[:page])
                    .per(20)
  end

  def show
    @product = Product.friendly.find(params[:id])

    return render(:not_found) unless @product.property?

    @property = Property.eager_load(
      :category, :equipments, :property_services
    ).find_by(id: @product.specific_id)
  end
end
