# frozen_string_literal: true

class LandingController < ApplicationController
  def index
    @products = Product.all.eager_load(:category)
  end
end
