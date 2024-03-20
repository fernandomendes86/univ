class StudentCoursesController < ApplicationController

  def create
    add_course = Course.find(params[:course_id])
    if current_user.courses << add_course
      flash.notice = "Enrolled in #{add_course.name.capitalize}."
      redirect_to current_user
    else
      flash.alert = 'Something was wrong with your enrolled'
      redirect_to root_path
    end
  end
end