class Book < ApplicationRecord
	belongs_to :user

# タイトルが空欄でなく、200文字以下
	validates :title, presence: true
	validates :body, length: {maximum:200}
	validates :body, presence: true
end
