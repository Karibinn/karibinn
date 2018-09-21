# frozen_string_literal: true

class BookingItemsController < ApplicationController
  def create
    form = RoomBookingForm.new(room_booking_form_params)
    command = Bookings::AddRoomType.new

    book(form, command)
  end

  def book_activity
    form = ActivityBookingForm.new(activity_booking_form_params)
    command = Bookings::AddActivity.new

    book(form, command)
  end

  def show
    @booking_item = current_or_guest_user.booking_items.find(params[:id])

    @activity_products = ProductRepository.activities_at_location(
      location_ids: @booking_item.product.location_id
    )
  end

  def destroy
    item = current_or_guest_user.booking_items.find(params[:id])

    item.destroy

    redirect_to booking_path, notice: I18n.t('bookings.show.removed_message', title: item.title)
  end

  private

  def book(form, command)
    booking_item = command.call(form, current_or_guest_user)

    redirect_to booking_booking_item_path(booking_item)
  rescue ArgumentError => e # from Date.parse
    Rails.logger.error(e)
    redirect_to request.referrer, alert: I18n.t('booking_items.create.error')
  end

  def room_booking_form_params
    params.require(:room_booking_form).permit(
      :room_type_id,
      :date_range_s,
      :guests
    )
  end

  def activity_booking_form_params
    params.require(:activity_booking_form).permit(
      :product_id,
      :date_s,
      :guests
    )
  end
end
