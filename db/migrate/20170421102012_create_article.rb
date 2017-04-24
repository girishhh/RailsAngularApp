class CreateArticle < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :heading
      t.string :url
      t.string :summary
      t.text :description
    end
  end
end
