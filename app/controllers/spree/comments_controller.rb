class Spree::CommentsController < Spree::StoreController
	skip_before_filter :verify_authenticity_token, :only => [:delete_comment]
	def add_comment
		prod = Spree::Product.find(params[:product_id])
		comment = params[:comment]
	 	@comment = Comment.build_from(Spree::Product.first, spree_current_user.id,
	 						 comment)
	 	
	 	respond_to do |format|
	 		if @comment.save
	 			format.js
	 		else 
	 			format.js
	 		end
	 	end
	end

	def delete_comment
		@comment = Comment.find(params[:comment_id])
		if spree_current_user && spree_current_user.id == @comment.user_id
			respond_to do |format|
				if @comment.delete
					format.js {@chk =true}
				else 
					format.js {@chk = false}
				end
			end
		else 
			respond_to do |format|
				format.js {@chk = false}
			end
		end
	end

end