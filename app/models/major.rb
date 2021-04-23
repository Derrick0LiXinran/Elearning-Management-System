class Major < ApplicationRecord
  has_many :student_infos
  has_many :courses
  belongs_to :discipline
end
