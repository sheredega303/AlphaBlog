class CreateArticles < ActiveRecord::Migration[7.0] # Миграция для создания таблицы статей
  def change
    create_table :articles do |t|
      t.string :title # Переменная тайтл с типом данных стринг
      t.text :description # Переменная дескрипшин с типом данных текст
    end
  end
end
