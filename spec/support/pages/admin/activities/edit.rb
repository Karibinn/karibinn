# frozen_string_literal: true

module Pages
  module Admin
    module Activities
      class Edit < AePageObjects::Document
        path :edit_admin_activity

        form_for :activity do
          element :product_attributes_title_en
          element :product_attributes_title_fr
          element :product_attributes_description_en
          element :product_attributes_description_fr
        end

        def has_form?
          node.has_selector? 'form.edit_activity'
        end

        def change_record!(title_en:, title_fr:, category:)
          self.product_attributes_title_en.set title_en
          self.product_attributes_title_fr.set title_fr

          node.select category, from: 'Category'
          node.click_on 'Update Activity'

          window.change_to(Pages::Admin::Activities::Index)
        end
      end
    end
  end
end
