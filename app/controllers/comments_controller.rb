class CommentsController < ApplicationController

	def new
		@comment = Comment.new(link_id: params[:link_id], parent_id: params[:parent_id])
	end

	def create
		# binding.pry
		if params[:comment][:parent_id].to_i > 0
			parent = Comment.find_by_id(params[:comment].delete(:parent_id))
			@comment = parent.children.build(comment_params)
		else
			@comment = Comment.new(comment_params)
		end

		# need to auto assign this link_id
		@comment.link_id = params[:comment][:link_id].to_i
		if @comment.save
			redirect_to root_url
		else
			render :new
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:author, :comment)
	end

end