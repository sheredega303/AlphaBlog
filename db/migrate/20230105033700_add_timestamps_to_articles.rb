class AddTimestampsToArticles < ActiveRecord::Migration[7.0] # Бесполезная миграция для добавления колонок таймстемпов, в 7 рилсах по дефолту идут
  def change
    # add_column :articles, :created_at, :datetime
    # add_column :articles, :updated_at, :datetime
  end
end
