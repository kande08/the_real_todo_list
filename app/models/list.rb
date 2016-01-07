class List < ActiveRecord::Base
  has_many :items, dependent: :destroy
  # validations
  validates_presence_of :name 
end
