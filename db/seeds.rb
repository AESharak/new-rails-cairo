# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Users
puts "Creating Users..."
users = [
  { name: "John Doe", email: "john@example.com" },
  { name: "Jane Smith", email: "jane@example.com" },
  { name: "Bob Johnson", email: "bob@example.com" }
]

created_users = users.map do |user_attrs|
  User.create!(user_attrs)
end

# Create Editors
puts "Creating Editors..."
editors = [
  { name: "Alice Editor", email: "alice@publishing.com" },
  { name: "Mike Editor", email: "mike@publishing.com" },
  { name: "Sarah Editor", email: "sarah@publishing.com" }
]

created_editors = editors.map do |editor_attrs|
  Editor.create!(editor_attrs)
end

# Create Posts
puts "Creating Posts..."
posts = [
  { title: "First Post", content: "This is the content of the first post", user: created_users[0] },
  { title: "Second Post", content: "This is the content of the second post", user: created_users[1] },
  { title: "Third Post", content: "This is the content of the third post", user: created_users[2] },
  { title: "Fourth Post", content: "This is the content of the fourth post", user: created_users[0] }
]

created_posts = posts.map do |post_attrs|
  Post.create!(post_attrs)
end

# Associate Posts with Editors (M:M relationship)
puts "Creating Post-Editor associations..."
# First post is edited by first and second editors
PostEditorJoin.create!(post: created_posts[0], editor: created_editors[0])
PostEditorJoin.create!(post: created_posts[0], editor: created_editors[1])

# Second post is edited by second and third editors
PostEditorJoin.create!(post: created_posts[1], editor: created_editors[1])
PostEditorJoin.create!(post: created_posts[1], editor: created_editors[2])

# Third post is edited by all editors
PostEditorJoin.create!(post: created_posts[2], editor: created_editors[0])
PostEditorJoin.create!(post: created_posts[2], editor: created_editors[1])
PostEditorJoin.create!(post: created_posts[2], editor: created_editors[2])

# Fourth post is edited by the first editor
PostEditorJoin.create!(post: created_posts[3], editor: created_editors[0])

puts "Seeding completed successfully!"
