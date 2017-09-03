class Post < ApplicationRecord
	belongs_to :user

	def author
		author = User.find(self.user_id)
	end
end
