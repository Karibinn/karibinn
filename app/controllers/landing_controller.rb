# frozen_string_literal: true

class LandingController < ApplicationController
  LIMIT = 4

  def index
    @picks = Product
               .all
               .eager_load(:category, :images)
               .order(Arel.sql('random()'))
               .limit(LIMIT)

    @properties = Product
                    .properties
                    .eager_load(:category, :images)
                    .order(Arel.sql('random()'))
                    .limit(LIMIT)

    @experiences = Product
                     .activities
                     .eager_load(:category, :images)
                     .order(Arel.sql('random()'))
                     .limit(LIMIT)
  end
end
