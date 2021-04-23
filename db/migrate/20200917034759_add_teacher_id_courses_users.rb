class AddTeacherIdCoursesUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :courses_users, :teacher_id, :integer
  end
end
