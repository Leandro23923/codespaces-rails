class CreateArticlesTags < ActiveRecord::Migration[7.1]
  def change

    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end

    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    create_table :articles_tags, id: false do |t|
      t.belongs_to :article, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true
    end
  end
end
