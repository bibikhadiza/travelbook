class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.integer :car_rental
      t.integer :flight
      t.decimal :total_cost
      t.integer :diet
      t.integer :climate
      t.integer :destination_id
      t.string :content

      t.timestamps
    end
  end
end
