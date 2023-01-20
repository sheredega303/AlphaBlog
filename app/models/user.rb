class User < ApplicationRecord
  before_save { self.email  = email.downcase} # Сохраняет почту нижним регистром
  has_many :articles, dependent: :destroy # К нему привязаны статьи, в случае удаления юзера - удаляются зависимости
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # Регулярное выражение для почты
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 105}, format: { with: VALID_EMAIL_REGEX }
  has_secure_password # бикрипт
end