class CreateUsers < ActiveRecord::Migration[7.0] # Миграция для создания таблицы юзеров
  def change
    create_table :users do |t|
      t.string :username  # Юзернейм - стринг
      t.string :email # Имейл - стринг
      t.timestamps # Стандартно, время создания и изменения объёкта
    end
  end
end
