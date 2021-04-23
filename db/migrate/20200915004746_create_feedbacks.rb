class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.timestamps
    end
  end
end
