class Category < ActiveRecord::Base
  # Includes

  # Associations

  # Validations
  validates_presence_of :description

  # Callbacks

  # Scopes
  scope :order_by_description, -> { order(:description) }

  # Class Methods

  # Instance Methods

  private
    #Private Methods

end
