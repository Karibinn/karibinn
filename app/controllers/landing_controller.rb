# frozen_string_literal: true

class LandingController < ApplicationController
  def index
    @picks = ProductRepository.product_picks

    @properties = ProductRepository.properties_for_spacer

    @experiences = ProductRepository.activities_for_spacer

    @locations = Location.with_products
  end
end
