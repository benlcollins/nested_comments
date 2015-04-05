class LinksController < ApplicationController

	def index
		@links = Link.all
		# binding.pry
	end

	def show
		@link = Link.find(params[:id])
		# @comments = Comment.where(:link_id => params[:id])
		# @comments = Comment.hash_tree.select { |k,v| k = :link_id && v = 2 }
		# binding.pry
		@comments = Comment.hash_tree.select { |key,value|  key[:link_id] == params[:id].to_i }
		# @comments = Comment.hash_tree.select { |k,v| k = :link_id && v == params[:id] }
	end

end