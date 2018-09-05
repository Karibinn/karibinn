class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # TODO: spec it out after we know the flow of when
  # the user must create an account
  def logging_in_user
    booking = guest_user.booking

    booking.update(user_id: current_user.id)
  end
end
