class AddPasswordDigestToUsers < ActiveRecord::Migration[7.0] # Миграция для добавления пароля
  def change
    add_column :users, :password_digest, :string # Пароль типа стринг
  end
end
