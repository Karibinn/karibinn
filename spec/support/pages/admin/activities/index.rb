# frozen_string_literal: true

module Pages
  module Admin
    module Activities
      class Index < AePageObjects::Document
        path :admin_activities

        def visit_activity!(activity_name)
          node.click_on activity_name

          window.change_to(Pages::Admin::Activities::Edit)
        end

        def visit_new_activity_form!
          node.click_on 'New Activity'

          window.change_to(Pages::Admin::Activities::New)
        end

        def has_activity?(activity_name)
          node.has_content?(activity_name)
        end
      end
    end
  end
end
