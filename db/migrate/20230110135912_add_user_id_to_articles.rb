class AddUserIdToArticles < ActiveRecord::Migration[7.0] # Миграция для добавления новой колонки
  def change
    add_column :articles, :user_id, :integer # Колонка ИД автора для статей
  end
end
