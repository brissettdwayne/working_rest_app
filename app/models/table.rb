class Table < ActiveRecord::Base

  belongs_to :waiter
  has_many :customers
  has_many :orders, through: :customers

end
