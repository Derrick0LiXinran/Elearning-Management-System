class CreateCoursesTeacherInfos < ActiveRecord::Migration[6.0]
  def change

    create_table :courses_teacher_infos, id: false do |t|
      t.belongs_to :teacher_info
      t.belongs_to :course
    end

  end
end
