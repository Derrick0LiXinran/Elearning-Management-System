class Cart < ApplicationRecord
  belongs_to :student
  has_many :course_packages
  has_and_belongs_to_many :courses
end
