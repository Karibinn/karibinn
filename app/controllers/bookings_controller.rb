# frozen_string_literal: true

class BookingsController < ApplicationController
  def add
    form = ProductBookingForm.new(product_booking_form_params)

    AddProductToBooking.new.call(form, current_user)
  rescue ArgumentError => e # from Date.parse
    redirect_to path_for_product(product)
  end

  private

  def product_booking_form_params
    params.require(:product_booking_form).permit(
                                           :product_id,
                                           :date_from_s,
                                           :date_to_s,
                                           :guests
    )
  end
end
