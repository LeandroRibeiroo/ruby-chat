class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, id: false do |t|
      t.string :id, primary_key: true, null: false, limit: 36
      t.string :user_id, null: false, limit: 36
      t.string :name, null: false
      t.text :image_url, null: false
      t.text :email, null: false
      t.timestamps
    end

    add_index :profiles, :user_id, unique: true
  end
end
