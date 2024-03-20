class Student < ApplicationRecord
  has_secure_password
  
  validates_presence_of :name
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_save { self.email = email.downcase }

  has_many :student_courses
  has_many :courses, through: :student_courses, dependent: :destroy
end