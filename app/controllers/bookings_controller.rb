# frozen_string_literal: true

class BookingsController < ApplicationController
  def show
    @booking = current_or_guest_user.current_booking

    return render('bookings/empty') if @booking.nil? || @booking.items.empty?

    @items = @booking
               .items
               .eager_load(product: :images)
               .order(checkin_date: :asc)

    @activity_products = Product
                           .activities
                           .eager_load(:category, :images)
                           .order(Arel.sql('random()'))
                           .limit(4)
  end

  def checkout
    @booking = current_or_guest_user.current_booking

    return redirect_to(action: :show) unless @booking.present?

    @items = @booking
               .items
               .eager_load(product: :images)
               .order(checkin_date: :asc)
  end

  def confirmation
    @booking = current_user.current_booking

    return redirect_to(action: :show) unless @booking.present?

    @items = @booking.items.includes(product: :images)
    Bookings::Confirm.new.call(current_user)
  end
end
