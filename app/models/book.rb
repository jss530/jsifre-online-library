class Book < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :genre, optional: true
  has_many :comments
  accepts_nested_attributes_for :genre
 
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
     self.inventory = self.inventory + 1
     self.rented = false
     self.save
     self.user.credits = self.user.credits + self.cost
     self.user.save
  end
  
  def self.newest_books
    order('created_at desc').limit(5)
  end
  
  def genres_attributes=(genres_attributes)
    genres_attributes.values.each do |genre_attributes|
      unless genre_attributes[:name].blank?
      genre = Genre.find_or_create_by(genre_attributes)
      self.genre_id = genre.id
      end
    end
  end
  
end
