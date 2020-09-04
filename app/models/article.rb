class Article < ApplicationRecord
	# belongs_to :user
	has_many_attached :images
	has_one_attached :video

	def image
	    if images.attached?
	      images.first
	    else
	      'images.jpeg'
	    end
	end
end
