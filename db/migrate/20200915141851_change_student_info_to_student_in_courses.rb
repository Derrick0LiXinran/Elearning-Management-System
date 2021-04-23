class ChangeStudentInfoToStudentInCourses < ActiveRecord::Migration[6.0]
  def change
    rename_column :courses, :student_info_id, :student_id
  end
end
