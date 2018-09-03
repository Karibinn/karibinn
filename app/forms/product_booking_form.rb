# frozen_string_literal: true

class ProductBookingForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :product_id, :guests, :date_from_s, :date_to_s

  validates :guests, numericality: { minimum: 1, maximum: 10 }
  validates :date_from_s, :date_to_s, presence: true
  validates :product_id, presence: true

  def product
    Product.find(product_id)
  end

  def date_from
    Date.parse(date_from_s)
  end

  def date_to
    Date.parse(date_to_s)
  end
end
