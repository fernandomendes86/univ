class Course < ApplicationRecord
  validates_presence_of [:short_name, :name]

  has_many :student_courses
  has_many :students, through: :student_courses, dependent: :destroy
end