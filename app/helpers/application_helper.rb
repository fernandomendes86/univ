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

  def flash_message(type, msg)
    class_color = "p-4 mb-4 text-sm text-green-800 rounded-lg bg-green-50 dark:bg-gray-800 dark:text-green-400"
    class_color = "p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" if type != 'notice'     
    content_tag(:div, id: 'flash_message', class: class_color, role: "alert") do
      msg << content_tag(:button, type:"button", class: 'float-end text-[30px]') do 
               "&times;".html_safe
             end
      msg.html_safe
    end
  end
end