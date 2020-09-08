class Article < ApplicationRecord
	# belongs_to :user
	has_many_attached :images
	has_one_attached :video
	has_rich_text :content

	def image
	    if images.attached?
	      images.first
	    else
	      'images.jpeg'
	    end
	end
	
  	after_create :generate_hashed_id

  	def to_param
    	self.hashed_id
  	end

  	def generate_hashed_id
		array = ["#{('A'..'Z').to_a.shuffle[0,3].join}", "#{('0'..'9').to_a.shuffle[0,3].join}", "#{('A'..'Z').to_a.shuffle[0,3].join}", "#{('0'..'9').to_a.shuffle[0,3].join}", "#{('A'..'Z').to_a.shuffle[0,3].join}"]
		# str = array.join("-")
    	self.update_attributes(:hashed_id => array.join("-"))
  	end
end
