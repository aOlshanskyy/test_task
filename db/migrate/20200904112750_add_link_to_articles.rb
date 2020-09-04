class AddLinkToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :link, :string
  end
end
