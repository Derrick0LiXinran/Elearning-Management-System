class RenameCoursesNumInCourses < ActiveRecord::Migration[6.0]
  def change
    rename_column :courses, :courses_num, :course_number
  end
end
