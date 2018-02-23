class Library < ApplicationRecord
    belongs_to :user, optional: true

  def user_id=(users_id)
    users_id = self.user.id
    super(user_id)
  end

end
