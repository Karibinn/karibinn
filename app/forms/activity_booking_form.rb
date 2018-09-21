# frozen_string_literal: true

class ActivityBookingForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :product_id, :guests, :date_s

  validates :guests, numericality: { minimum: 1, maximum: 10 }
  validates :date_s, presence: true
  validates :product_id, presence: true

  def product
    Product.find(product_id)
  end

  def date
    @date ||= Date.parse(date_s)
  end
end
