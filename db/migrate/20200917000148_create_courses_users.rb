class CreateCoursesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :courses_users, id: false do |t|
      t.belongs_to :course
      t.belongs_to :user
    end
  end
end
