# frozen_string_literal: true

module Localizable
  extend ActiveSupport::Concern

  module ClassMethods
    def localizable(meth_name)
      define_method(meth_name) do |locale = I18n.locale|
        localized_meth_name = "#{meth_name}_#{locale}"

        if respond_to?(localized_meth_name)
          result = public_send(localized_meth_name)
          result.blank? ? public_send("#{meth_name}_#{I18n.default_locale}") : result
        else
          public_send("#{meth_name}_#{I18n.default_locale}")
        end
      end
    end
  end
end
