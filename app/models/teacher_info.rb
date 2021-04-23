class TeacherInfo < ApplicationRecord
  belongs_to :teacher
  belongs_to :discipline
  has_and_belongs_to_many :courses
end
