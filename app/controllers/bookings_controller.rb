# frozen_string_literal: true

class BookingsController < ApplicationController
  def show
    @booking = current_or_guest_user.current_booking

    return render('bookings/empty') if @booking.nil? || @booking.items.empty?

    @items = @booking
               .items
               .eager_load(:room_type, product: :images)
               .order(checkin_date: :asc)

    @activity_products = ProductRepository.activities_at_location(
      location_ids: @items.map { |item| item.product.location_id }
    )
  end

  def checkout
    @booking = current_or_guest_user.current_booking

    return redirect_to(action: :show) unless @booking.present?

    @items = @booking
               .items
               .eager_load(:room_type, product: :images)
               .order(checkin_date: :asc)
  end

  def personal_information
    @booking_form = Bookings::PersonalInformationForm.new(
      number_of_adults: 2, number_of_children: 0
    )
  end

  def confirmation
    @booking = current_or_guest_user.current_booking

    return redirect_to(action: :show) unless @booking.present?

    @booking_form = Bookings::PersonalInformationForm.new(personal_information_params)

    return render(:personal_information) unless @booking_form.valid?

    @items = @booking.items.includes(:room_type, product: :images)

    Bookings::Confirm.new.call(@booking_form, current_or_guest_user)

    @activity_products = ProductRepository.activities_at_location(
      location_ids: @items.map { |item| item.product.location_id }
    )
  end

  private

  def personal_information_params
    params.require(:bookings_personal_information_form).permit(
      Bookings::PersonalInformationForm::ATTRIBUTES
    )
  end
end
