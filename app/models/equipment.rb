# frozen_string_literal: true

class Equipment < ApplicationRecord
  include Localizable
  localizable :name

  def image_url
    'https://via.placeholder.com/40x40'
  end
end
