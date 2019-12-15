class Post < ApplicationRecord
  has_rich_text :content

  has_one_attached :main_image

  enum catergory: { Marketing: 1, 'Company News': 2, Engineering: 3 }
end
