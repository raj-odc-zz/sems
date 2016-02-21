module LayoutMethods
  extend ActiveSupport::Concern
  #
  def fetch_layouts
    case "#{action_name}"
    when "new","edit"
      false
    else
      "application.html.erb"
    end
  end
  #
end