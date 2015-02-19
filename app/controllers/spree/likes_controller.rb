module Spree
	class LikesController < Spree::HomeController
		before_action :authenticate_login
		def create
			@s = Suite.where(id: params[:id]).first if params[:id]
			u = spree_current_user
			like = Like.new(user_id: u.id, suite_id: @s.id)
			if like.save
				respond_to do |format|
					format.js
				end
			else
				respond_to do |format|
					format.js {redirect_to :back, notice: 'something went wrong'}
				end
			end
		end
		
		def destroy
			@s = Suite.where(id: params[:id]).first if params[:id]
			u = spree_current_user
			like = Like.where(suite_id: @s.id, user_id: u.id).first
			if like.destroy
				respond_to do |format|
					format.js
				end
			else
				respond_to do |format|
					format.js {redirect_to :back, notice: 'something went wrong'}
				end
			end
		end

		private
			def authenticate_login
				if !spree_current_user.present?
					redirect_to :back, notice: 'Please login'
				end
			end
	end
end