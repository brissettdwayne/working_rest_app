class Customer < ActiveRecord::Base

  belongs_to :table
  has_many :orders
  has_many :foods, through: :orders
end
