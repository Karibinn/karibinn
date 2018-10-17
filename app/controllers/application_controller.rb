# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    requested_locale = params[:lang]

    locale = if requested_locale && I18n.available_locales.map(&:to_s).include?(requested_locale)
               requested_locale
             else
               I18n.default_locale
             end

    I18n.locale = locale
  end

  def default_url_options
    if I18n.locale != I18n.default_locale
      { lang: I18n.locale }
    else
      {}
    end
  end

  # TODO: spec it out after we know the flow of when
  # the user must create an account
  def logging_in_user
    booking = guest_user.current_booking

    current_user.current_booking.destroy if current_user.current_booking.present?

    booking.update(user_id: current_user.id) if booking
  end

  def current_or_guest_user
    if current_user
      if session[:guest_user_id]
        logging_in_user
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end
end
