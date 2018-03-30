class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :book
  belongs_to :user
end
