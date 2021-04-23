class CoursePackage < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  belongs_to :cart

end
