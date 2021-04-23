class AddStudentIdToStudentInfo < ActiveRecord::Migration[6.0]
  def change
    add_column(:student_infos, :student_id,:string)
  end
end
