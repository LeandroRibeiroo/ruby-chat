class RemoveUserIdFromProfiles < ActiveRecord::Migration[7.2]
  def change
    remove_column :profiles, :user_id, :string
  end
end
