class Library < ApplicationRecord
    belongs_to :user, optional: true
    
end