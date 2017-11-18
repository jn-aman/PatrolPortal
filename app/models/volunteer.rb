class Volunteer < ActiveRecord::Base



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	def self.import
	
	xlsx = Roo::Spreadsheet.open(File.join('public', 'volunteers.xlsx'))
		counter = 1
		xlsx.sheet('Form Responses').each(name: 'Name', police_station: 'Police Station', n_police_chowki: 'Nearest Police Chowki', mobile_no: 'Mobile Number', category: 'Category', email_id: 'Email Address') do |hash|
			new_password = 'Volunteer_' + counter.to_s

        	new_vol = Volunteer.create(name: hash[:name].to_s, police_station: hash[:police_station].to_s, nearest_police_chowki: hash[:n_police_chowki].to_s, mobile_number: hash[:mobile_no].to_s, category: hash[:category].to_s, email: hash[:email_id], password: new_password)
		
        	counter += 1
		
		end

	end


def self.unique_policestations
		stations = []
		Volunteer.all.each do |vol|
			stations.push(vol.police_station.capitalize)
		end
		stations.delete("")
		return stations.uniq
	end

def self.unique_name
		n = []
		Volunteer.all.each do |vol|
			n.push(vol.name.capitalize)
		end
		n.delete("")
		return n.uniq
	end

end

