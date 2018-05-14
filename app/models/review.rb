class Review < ApplicationRecord
  belongs_to :product
  validates :rating, presence: true, inclusion: 0..5 
  
end