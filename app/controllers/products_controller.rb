# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.friendly.find(params[:id])
  end
end
