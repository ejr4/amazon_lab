class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :rating, presence: true, inclusion: 0..5 
  
end