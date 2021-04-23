class Discipline < ApplicationRecord
  has_many :teacher_infos
  has_many :majors
  has_many :courses
end
