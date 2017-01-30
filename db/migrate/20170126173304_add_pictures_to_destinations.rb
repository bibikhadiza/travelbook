class AddPicturesToDestinations < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :pictures, :string
  end
end
