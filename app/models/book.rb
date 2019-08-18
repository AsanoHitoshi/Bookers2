class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments
	has_many :favorites, dependent: :destroy
# タイトルが空欄でなく、200文字以下
	validates :title, presence: true
	validates :body, length: {maximum:200}
	validates :body, presence: true
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def self.search(method,word)

        if method == "forward_match"
        	@books = Book.where("title LIKE?","#{word}%")

        elsif method == "backward_match"
        	@books = Book.where("title LIKE?","%#{word}")

        elsif method == "perfect_match"
        	@books = Book.where("#{word}")

        elsif method == "partial_match"
        	@books = Book.where("title LIKE?","%#{word}%")

        else
        	@books = Book.all
        end

 	end


end
