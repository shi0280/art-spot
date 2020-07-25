class CreateSpotUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :spot_users do |t|
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true
      t.timestamps
    end
  end
end
