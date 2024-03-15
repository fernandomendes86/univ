module ApplicationHelper
  def errors_for(form, field)
    content_tag(:p, form.object.errors[field].try(:first), class: 'text-red-800') if form.object
  end

  def session_link
    if logged_in?
      button_to('(logout)', logout_path , method: :delete, class: 'block mt-4 lg:inline-block lg:mt-0 text-teal-200 hover:text-white mr-4')
    else
      button_to('(login)', login_path, method: :get, class: 'block mt-4 lg:inline-block lg:mt-0 text-teal-200 hover:text-white mr-4')
    end
  end
end