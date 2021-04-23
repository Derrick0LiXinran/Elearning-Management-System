class CreatePurchasedHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchased_histories do |t|
      t.integer :course_id
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
