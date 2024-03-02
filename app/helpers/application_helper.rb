module ApplicationHelper
  def errors_for(form, field)
    content_tag(:p, form.object.errors[field].try(:first), class: 'text-red-800')
  end
end
