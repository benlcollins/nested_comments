class LinksController < ApplicationController

	def index
		@links = Link.all
		# binding.pry
	end

	def show
		@link = Link.find(params[:id])
		# @comments = Comment.where(:link_id => params[:id])
		# @comments = Comment.hash_tree
		@comments = Comment.hash_tree.select { |key,value|  key[:link_id] == params[:id].to_i }
	end

end