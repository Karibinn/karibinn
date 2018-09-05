# frozen_string_literal: true

class Equipment < ApplicationRecord
  include Localizable
  localizable :name
end
