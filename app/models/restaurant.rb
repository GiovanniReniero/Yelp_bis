class Restaurant < ApplicationRecord

  validates :name, presence: true, uniqueness: {case_sensitive: false}    
  validates :address,  presence: true, uniqueness: {case_sensitive: false}    
  validates :category, presence: true  

end
