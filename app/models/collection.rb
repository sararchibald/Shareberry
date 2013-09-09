

class Collection < ActiveRecord::Base
  has_and_belongs_to_many :records
  has_and_belongs_to_many :users
end
