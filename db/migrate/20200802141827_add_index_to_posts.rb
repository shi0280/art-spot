class AddIndexToPosts < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :title, length: 32
  end
end
