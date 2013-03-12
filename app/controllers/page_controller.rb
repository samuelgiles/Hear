class PageController < ApplicationController

	def home
		if current_user
			redirect_to "/u/" + current_user.username
		end
		@user = User.new
	end

	def nouser
	end

end
