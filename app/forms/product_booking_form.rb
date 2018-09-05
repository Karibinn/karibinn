# frozen_string_literal: true

class ProductBookingForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :product_id, :guests, :date_range_s

  validates :guests, numericality: { minimum: 1, maximum: 10 }
  validates :date_range_s, presence: true
  validates :product_id, presence: true

  def product
    Product.find(product_id)
  end

  def checkin_date
    @checkin_date ||= Date.parse(split_date_range.first)
  end

  def checkout_date
    @checkout_date ||= Date.parse(split_date_range.last)
  end

  private

  def split_date_range
    date_range_s.split(' - ')
  end
end