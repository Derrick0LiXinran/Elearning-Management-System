class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.belongs_to :student

      t.timestamps
    end

    create_table :carts_courses do |t|

      t.belongs_to :cart
      t.belongs_to :course

      t.timestamps
    end
  end
end
