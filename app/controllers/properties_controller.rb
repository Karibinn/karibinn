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

    return render('not_found') unless @product.property?

    @property = Property.eager_load(
      :category, :property_services, room_types: %i[equipments]
    ).find_by(id: @product.specific_id)

    if params[:room_type_id]
      @room_type = @property.room_types.find { |type| type.id.to_s == params[:room_type_id] }
    elsif @property.room_types.one?
      @room_type = @property.room_types.first
    end
  end
end
