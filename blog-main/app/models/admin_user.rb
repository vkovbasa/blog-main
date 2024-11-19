class AdminUser < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Додайте цей метод для дозволу атрибутів
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
end
