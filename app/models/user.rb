class User < ApplicationRecord
  has_many :books
  has_many :comments, through: :books
  has_one :library
  belongs_to :my_library, class_name: 'Library'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]

  validates :email, uniqueness: true, presence: true

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    end
   end
  
   def my_library=(library)
    self.my_library_id = library.id if library
    @my_library = library
    self.save
   end

  def my_library
    @my_library = Library.find_by(id: self.my_library_id)
  end

end
