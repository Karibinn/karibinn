# frozen_string_literal: true

module Bookings
  class PersonalInformationForm
    ATTRIBUTES =
      %i[first_name last_name email phone country number_of_adults number_of_children].freeze
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor(*ATTRIBUTES)

    validates :first_name, :last_name, :email, :country,
              :number_of_adults, :number_of_children, presence: true

    validates :number_of_adults, :number_of_children, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    }
  end
end
