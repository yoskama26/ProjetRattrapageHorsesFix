class Stable < ApplicationRecord
  has_many :horses, dependent: :destroy
  belongs_to :address

  accepts_nested_attributes_for :address
  validates_associated :address
end

