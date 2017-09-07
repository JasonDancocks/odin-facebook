class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user

	def author
		user.name
	end
end
