module SessionsHelper

	#logs in given user
	def log_in(user)
		session[:user_id] = user.id
	end

	# Returns current logged-in user
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# Returns true if the user is logged in
	def logged_in?
		!current_user.nil?
	end

	# logs out the current user
	def log_out
		session.delete(:user_id)
		@current_user = nil	
	end
end
