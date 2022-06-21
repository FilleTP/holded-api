class Proposal < ApplicationRecord
  belongs_to :customer
  has_many :object_items
  has_many :pvgisdatas, dependent: :destroy
  accepts_nested_attributes_for :pvgisdatas, reject_if: :all_blank, allow_destroy: true
  has_many :pvgis, dependent: :destroy
  accepts_nested_attributes_for :object_items, reject_if: :all_blank, allow_destroy: true
  # validates :date, presence: true
  validates_associated :pvgisdatas
end
