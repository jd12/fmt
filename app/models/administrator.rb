class Administrator < ActiveRecord::Base

  devise :database_authenticatable, :timeoutable

end
