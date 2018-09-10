# frozen_string_literal: true

module BootstrapHelper
  def tab_to(title, url)
    is_active = current_page?(url)
    classes = ['nav-link', (is_active ? 'active' : nil)].compact

    content_tag(:li, class: 'nav-item') do
      link_to title, url, class: classes
    end
  end
end
