# frozen_string_literal: true

module Pages
  module Admin
    module Properties
      class Edit < AePageObjects::Document
        path :edit_admin_property

        form_for :property do
          element :product_attributes_title_en
          element :product_attributes_title_fr
          element :product_attributes_description_en
          element :product_attributes_description_fr
        end

        def has_form?
          node.has_selector? 'form.edit_property'
        end

        def change_record!(title_en:, title_fr:)
          self.product_attributes_title_en.set title_en
          self.product_attributes_title_fr.set title_fr

          node.click_on 'Update Property'

          window.change_to(Pages::Admin::Properties::Index)
        end
      end
    end
  end
end
