class AddPostCate < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :cate_id, :integer
  end
end
