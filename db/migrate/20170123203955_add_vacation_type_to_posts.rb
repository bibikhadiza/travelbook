class AddVacationTypeToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :vacation_type, :string
  end
end
