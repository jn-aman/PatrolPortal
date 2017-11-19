class Crime < ActiveRecord::Base
has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

def self.unique_loc
		n = []
		Crime.all.each do |vol|
			n.push(vol.Locality)
		end
		n.delete("")
		return n.uniq
	end
end
