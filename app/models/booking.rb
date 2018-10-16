# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user

  has_many :items, class_name: 'BookingItem', inverse_of: :booking, dependent: :destroy

  enum state: {
    initial: 0,
    confirmed: 4
  }

  def total
    items.sum(&:price)
  end

  def nights
    properties = items.select(&:property?)

    if properties.any?
      checkout = items.select(&:property?).max_by(&:checkout_date).checkout_date
      checkin = items.select(&:property?).min_by(&:checkin_date).checkin_date

    ((checkout - checkin).to_f / 1.day).floor
    else
      0
    end
  end

  def country_name
    iso_country = ISO3166::Country[country]
    iso_country.translations[I18n.locale.to_s] || iso_country.name
  end
end
