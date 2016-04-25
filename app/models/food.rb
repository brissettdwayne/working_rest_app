class Food < ActiveRecord::Base

  belongs_to :table
  has_many :customers, through: :orders

end
