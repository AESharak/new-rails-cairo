class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:posts)
      create_table :posts do |t|
        t.string :title
        t.references :user, null: false, foreign_key: true

        t.timestamps
      end
    else
      # If table already exists, add any missing columns
      unless column_exists?(:posts, :user_id)
        # First, add the column as nullable
        add_reference :posts, :user, null: true, foreign_key: true
        
        # Check if there are any users
        if User.exists?
          # Set a default user for existing posts
          default_user_id = User.first.id
          execute("UPDATE posts SET user_id = #{default_user_id}")
          
          # Now make the column non-nullable
          change_column_null :posts, :user_id, false
        end
      end
    end
  end
end
