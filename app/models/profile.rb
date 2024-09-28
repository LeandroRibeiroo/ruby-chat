# app/models/profile.rb
class Profile < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :image_url, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  before_create :assign_uuid

  private
  def assign_uuid
    self.id = SecureRandom.uuid unless self.id.present?
  end

  def password_required?
    new_record? || password.present?
  end
end
