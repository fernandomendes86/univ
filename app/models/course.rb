class Course < ApplicationRecord
  validates_presence_of [:short_name, :name]
end