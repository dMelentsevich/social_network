class RemoveTimestampsFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :timestamps, :string
  end
end
