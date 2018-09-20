# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user

  has_many :items, class_name: 'BookingItem', inverse_of: :booking

  enum state: {
    initial: 0,
    confirmed: 4
  }

  def total
    items.sum(&:price)
  end

  def country_name
    iso_country = ISO3166::Country[country]
    iso_country.translations[I18n.locale.to_s] || iso_country.name
  end
end
