class VolunteersController < ApplicationController
 
 def index
    @volunteers = Volunteer.all
    @pol=Volunteer.unique_policestations
   @name=Volunteer.unique_name
@cat=Volunteer.unique_cat
@loc=Crime.unique_loc
  end

  def index1
    @volunteers = Volunteer.all
    @pol=Volunteer.unique_policestations
    @name=Volunteer.unique_name
    @cat=Volunteer.unique_cat
    @loc=Crime.unique_loc
  end

def sp
 @v=Volunteer.where("police_station = ?", params[:police_station])
end
def nam
@v=Volunteer.where("name = ?", params[:name])
end
def cat
@v=Volunteer.where("category = ?", params[:category])
end

end
