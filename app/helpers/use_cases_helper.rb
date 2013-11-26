module UseCasesHelper

  def usecase_subheader(name, use_case, method)
    if use_case.send(method).first.try(:description).present?
      html = content_tag(:h4, name)
      use_case.send(method).each_with_index do |item, index|
        html << "<b>#{index+1}</b> #{item.description}<br /><br />".html_safe
      end
      html
    end
  end

end