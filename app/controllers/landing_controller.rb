# frozen_string_literal: true

class LandingController < ApplicationController
  def index
    @picks = Product.all.eager_load(:category).order('random()').limit(3)
    @properties = Product.properties.eager_load(:category).order('random()').limit(3)
    @experiences = Product.activities.eager_load(:category).order('random()').limit(3)
  end
end
