class Admin < ActiveRecord::Base
  # Includes
  
  # Enums
  enum role: [:full_access, :restricted_access]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations

  # Validations

  # Callbacks

  # Scopes
  scope :with_full_access, -> { where(role: 0) }
  scope :with_restricted_access, -> { where(role: 1) }

  # Class Methods

  # Instances Methods

  private
    # Private Methods
end
