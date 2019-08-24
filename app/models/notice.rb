class Notice < ApplicationRecord
	belongs_to :admin
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
    end
end
