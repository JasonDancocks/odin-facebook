class Post < ApplicationRecord
	belongs_to :user
	has_many :likes
	has_many :fans, through: :likes, source: :user
	default_scope { order(created_at: :desc)}
	

	def time_posted
		updated_at.to_time
	end

	def preview
		if body.length < 140
			body
		else
			preview = body[0..300] + "..."
		end
	end
end
