class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image
# nameが２〜２０文字、空欄でない、一意であること
  validates :name, length: {in:2..20}
  validates :name, presence: true
  validates :name, uniqueness: true
# introductionが０〜50文字であること
  validates :introduction, length: {maximum:50}

 def email_required?
   false
 end
 def email_changed?
   false
 end

end
