# frozen_string_literal: true

class BookingsController < ApplicationController
  def show
    @booking = current_or_guest_user.current_booking

    @items = @booking
               .items
               .eager_load(product: :images)
               .order(checkin_date: :asc)

    @activity_products = Product
                           .activities
                           .eager_load(:category, :images)
                           .order('random()')
                           .limit(5)
  end
end
