class RemoveStudentIdFromFeebacks < ActiveRecord::Migration[6.0]
  def change
    remove_column :feedbacks, :student_id
  end
end
