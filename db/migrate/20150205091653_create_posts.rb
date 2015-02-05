class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.belongs_to :user, index: true
    end
  end
end
