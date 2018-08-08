class Crime < ActiveRecord::Base
	mount_base64_uploader :image, ProductImageUploader
	has_attached_file :avatar, styles: { regular: '800x800>',medium: "800x800>", thumb: "100x100>" }, default_url: "http://via.placeholder.com/350x150",source_file_options: { regular: "-density 96 -depth 8 -quality 85" },
    convert_options: { size: "300x300>"}
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
