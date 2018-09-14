# frozen_string_literal: true

class PropertySearchForm
  include ActiveModel::Model

  attr_accessor :guests, :home_type, :dates, :page, :per_page

  alias_attribute :category_id, :home_type

  # TODO: search by available dates
end
