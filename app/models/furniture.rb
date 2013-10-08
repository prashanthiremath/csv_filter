class Furniture < ActiveRecord::Base
   attr_accessible :kind, :height, :emergency_exit, :openable
end
