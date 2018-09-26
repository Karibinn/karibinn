# frozen_string_literal: true

class LocationsController < ApplicationController
  PER_PAGE = 20

  def index
    @locations = Location.with_products
    @sample_offers = ProductRepository.product_picks(limit: 8)
    @properties = ProductRepository.properties_for_spacer
    @activities = ProductRepository.activities_for_spacer

    @focus_section_presenter = FocusSectionPresenter.new
  end

  def show
    @location = Location.friendly.find(params[:id])

    @search_form = PropertySearchForm.new(
      property_search_form_params.merge(
        location_slug: @location.slug,
        page: params[:page],
        per_page: PER_PAGE

      )
    )
    @property_products = ProductRepository.search_properties(@search_form)
  end

  private

  def property_search_form_params
    params.fetch(:property_search_form, {}).permit(:guests, :home_type, :dates, :phrase)
  end
end
