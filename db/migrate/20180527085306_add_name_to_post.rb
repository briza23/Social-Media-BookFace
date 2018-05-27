class AddNameToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :name, :string
  end
end
