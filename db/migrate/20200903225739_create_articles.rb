class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.boolean :publish, default: false, null: false
      t.integer :access, default: 0, null: false

      t.timestamps
    end
  end
end
