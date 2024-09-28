class AddPasswordDigestToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :password_digest, :string
  end
end
