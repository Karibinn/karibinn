# frozen_string_literal: true

module LocaleHelper
  def language
    case I18n.locale
    when :en
      'English'
    when :fr
      'Français'
    end
  end
end
