# frozen_string_literal: true

class PropertySearchForm
  ATTRIBUTES = %i[guests home_type dates location_slug page per_page phrase].freeze

  include ActiveModel::Model

  attr_accessor *ATTRIBUTES

  alias_attribute :category_id, :home_type

  # TODO: search by available dates
  def filled?
    ATTRIBUTES.any? do |attr|
      public_send(attr).present?
    end
  end
end
