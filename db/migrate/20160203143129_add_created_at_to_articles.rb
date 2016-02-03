class AddCreatedAtToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :updated_at, :datetime
  	add_column :articles, :created_at, :datetime
  	add_column :articles, :description, :text
  end
end
