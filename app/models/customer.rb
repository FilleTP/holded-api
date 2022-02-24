class Customer < ApplicationRecord
  has_many :proposals
  validates :name, uniqueness: true
end
