class AddHashedIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :hashed_id, :string
  end
end
