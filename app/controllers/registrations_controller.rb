class RegistrationsController < Devise::RegistrationsController
  def create
    super do
        resource.library = Library.new
        resource.save
    end
  end
end
