# frozen_string_literal: true

module Pages
  module Admin
    class Properties < AePageObjects::Document
      path :admin_root

      def visit_property!(property_name)
        node.click_on property_name

        window.change_to(Pages::Admin::EditProperty)
      end

      def visit_new_property_form!(property_name)
        node.click_on 'New Property'

        window.change_to(Pages::Admin::NewProperty)
      end

      def has_property?(property_name)
        node.has_content?(property_name)
      end
    end
  end
end
