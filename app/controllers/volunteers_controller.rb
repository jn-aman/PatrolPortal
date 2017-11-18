class VolunteersController < ApplicationController
 
 def index
    @volunteers = Volunteer.all
    @pol=Volunteer.unique_policestations
   @name=Volunteer.unique_name
  end

  def index1
    @volunteers = Volunteer.all
    @pol=Volunteer.unique_policestations
    @name=Volunteer.unique_name
  end

def sp
 @v=Volunteer.where("police_station = ?", params[:police_station])
end
def nam
@v=Volunteer.where("name = ?", params[:name])
end


end
