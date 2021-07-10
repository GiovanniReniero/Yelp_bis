class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, presence: true, uniqueness: {case_sensitive: false}    
  validates :category, presence: true  

end
