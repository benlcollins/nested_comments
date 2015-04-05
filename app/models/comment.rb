class Comment < ActiveRecord::Base
	belongs_to :link
	acts_as_tree order: 'created_at DESC'
end