class Article < ActiveRecord::Base
	validates_presence_of :url,:heading,:summary,:description
end