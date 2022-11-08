class CreateCategoriesBlogsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :blogs do |t|
      t.index :category_id
      t.index :blog_id
    end
  end
end
