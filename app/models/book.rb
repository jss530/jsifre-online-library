class Book < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :genre, optional: true
  has_many :comments
 
  validates :title, presence: true
  validates :author, presence: true
  
  def available?
    if self.inventory != 0
      return true
    else
      return false
    end
  end
  
  def borrow
     self.inventory = self.inventory - 1
     self.rented = true
     self.save
     self.user.credits = self.user.credits - self.cost
     self.user.save
  end
  
  def return_book
     self.user.credits = self.user.credits + self.cost
     self.user.save
     self.inventory = self.inventory + 1
     self.user_id = self.owner_number
     self.rented = false
     self.save
  end
  
  def self.newest_books
    order('created_at desc').limit(5)
  end
  
  def newest_comments
    self.comments.order('created_at desc').limit(3)
  end
  
end
