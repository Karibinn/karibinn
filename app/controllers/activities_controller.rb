# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def index
    @products = ProductRepository.activities_for_cards(page: params[:page])
  end

  def show
    @product = Product.friendly.find(params[:id])
    @activity = @product.activity
  end
end
