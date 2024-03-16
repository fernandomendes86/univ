class StudentsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :set_student, only: [:show, :edit, :update]
  before_action :is_allowed?, only: [:edit, :update]
  
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash.notice = "Student #{@student.name.capitalize} was successfully created."
      redirect_to @student
    else
      render 'new'
    end
  end

  def update
    if @student.update(student_params)
      flash.notice = "Student #{@student.name.capitalize} was successfully updated."
      redirect_to @student
    else
      render 'edit'
    end
  end

  private

  def is_allowed?
    return if @student == current_user
  
    redirect_to current_user
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end
end