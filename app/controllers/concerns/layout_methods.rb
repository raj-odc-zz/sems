module LayoutMethods
  extend ActiveSupport::Concern
  #
  def fetch_layouts
    case action_name
    when "new","edit","mark_entry","salary_detail_pdf", 'fees_receipt'
      false
    else
      "application.html.erb"
    end
  end
  #
end