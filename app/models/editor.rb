class Editor < ApplicationRecord
  has_many :post_editor_joins
  has_many :posts, through: :post_editor_joins
end
