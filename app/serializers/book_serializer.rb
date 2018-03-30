class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :year
  has_many :comments
  belongs_to :genre
end
