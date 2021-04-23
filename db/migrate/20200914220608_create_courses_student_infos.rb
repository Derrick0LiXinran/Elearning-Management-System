class CreateCoursesStudentInfos < ActiveRecord::Migration[6.0]
  def change

    create_table :courses_student_infos, id: false do |t|
        t.belongs_to :student_info
        t.belongs_to :course
     end

  end
end
