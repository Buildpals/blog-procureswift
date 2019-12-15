class Post < ApplicationRecord
  belongs_to :user

  has_rich_text :content

  has_one_attached :main_image

  enum catergory: { Marketing: 1, company_news: 2, Engineering: 3 }
end
