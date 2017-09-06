class Post < ApplicationRecord
	belongs_to :user
	default_scope { order(created_at: :desc)}
	

	def time_posted
		updated_at.to_time
	end
end
