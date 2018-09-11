# frozen_string_literal: true

class BookingItemsController < ApplicationController
  def create
    form = RoomBookingForm.new(room_booking_form_params)

    booking_item = Bookings::AddRoomType.new.call(form, current_or_guest_user)

    redirect_to booking_booking_item_path(booking_item)
  rescue ArgumentError => e # from Date.parse
    Rails.logger.error(e)
    flash.alert = I18n.t('booking_items.create.error')
    redirect_to request.referrer
  end

  def show
    @booking_item = current_or_guest_user.booking_items.find(params[:id])

    @activity_products = Product
                           .activities
                           .eager_load(:category, :images)
                           .order(Arel.sql('random()'))
                           .limit(4)
  end

  def destroy
    item = current_or_guest_user.booking_items.find(params[:id])

    item.destroy
    flash.notice = I18n.t('bookings.show.removed_message', title: item.title)

    redirect_to booking_path
  end

  private

  def room_booking_form_params
    params.require(:room_booking_form).permit(
      :room_type_id,
      :date_range_s,
      :guests
    )
  end
end
