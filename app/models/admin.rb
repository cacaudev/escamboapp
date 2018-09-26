class Admin < ActiveRecord::Base
  # Includes
  enum role: [:full_access, :restricted_access]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations

  # Validations

  # Callbacks

  # Scopes
  scope :with_full_access, -> { where(role: 'full_access') }

  # Class Methods

  def role_translation
    if self.role == 'full_access'
      'Acesso Completo'
    else
      'Acesso Restrito'
    end
  end

  # Instances Methods

  private
    # Private Methods
end
