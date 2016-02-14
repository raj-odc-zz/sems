module LayoutMethods
  extend ActiveSupport::Concern
  #
  def fetch_layouts
    case "#{controller_name} #{action_name}"
    when "roles new","roles edit"
      false
    else
      "application.html.erb"
    end
  end
  #
end