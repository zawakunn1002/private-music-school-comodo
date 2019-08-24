class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :notice, counter_cache: :favorites_count
end
