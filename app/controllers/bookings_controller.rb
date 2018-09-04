# frozen_string_literal: true

class BookingsController < ApplicationController
  def add
    form = ProductBookingForm.new(product_booking_form_params)

    AddProductToBooking.new.call(form, current_user)

    @activity_products = Product.activities.order('rand()').limit(5)
  rescue ArgumentError => e # from Date.parse
    Rails.logger.error(e)
    flash.alert = I18n.t('booking.add.error')
    redirect_to request.referer
  end

  private

  def product_booking_form_params
    params.require(:product_booking_form).permit(
      :product_id,
      :date_range_s,
      :guests
    )
  end
end
