module UsersHelper

	def not_friends?
		if @user != current_user 
			if !current_user.friends.include?(@user)
				if !current_user.pending.include?(@user)
					return true
				end
			end
		end 
	end
	
end