# frozen_string_literal: true

module Pages
  module Admin
    module Properties
      class Index < AePageObjects::Document
        path :admin_root

        def visit_property!(property_name)
          node.click_on property_name

          window.change_to(Pages::Admin::Properties::Edit)
        end

        def visit_new_property_form!
          node.click_on 'New Property'

          window.change_to(Pages::Admin::Properties::New)
        end

        def has_property?(property_name)
          node.has_content?(property_name)
        end
      end
    end
  end
end
