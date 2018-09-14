# frozen_string_literal: true

class PropertiesController < ApplicationController
  PER_PAGE = 20

  def index
    @search_form = PropertySearchForm.new(
      property_search_form_params.merge(page: params[:page], per_page: PER_PAGE)
    )
    @products = ProductRepository.search_properties(@search_form)
  end

  def show
    @product = Product.friendly.find(params[:id])

    return render('not_found') unless @product.property?

    @property = Property.eager_load(
      :category, :property_services, room_types: %i[amenities]
    ).find_by(id: @product.specific_id)

    if params[:room_type_id]
      @room_type = @property.room_types.find { |type| type.id.to_s == params[:room_type_id] }
    elsif @property.room_types.one?
      @room_type = @property.room_types.first
    end
  end

  private

  def property_search_form_params
    params.fetch(:property_search_form, {}).permit(:guests, :home_type, :dates)
  end
end
