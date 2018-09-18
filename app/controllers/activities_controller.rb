# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def index
    @products = Product
                  .activities
                  .eager_load(:category, :images)
                  .page(params[:page])
  end

  def show
    @product = Product.friendly.find(params[:id])
  end
end
