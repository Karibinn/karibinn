module ApplicationHelper
  def activity_page?
    controller.controller_name == 'activities'
  end

  def property_page?
    controller.controller_name == 'properties'
  end
end
