class CreateMajors < ActiveRecord::Migration[6.0]
  def change
    create_table :majors do |t|
      t.string :major_name
      t.integer :discipline_id
      t.timestamps
    end
  end
end
