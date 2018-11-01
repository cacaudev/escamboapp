class Ad < ActiveRecord::Base
  belongs_to :member
  belongs_to :category

  # gem paperclip
  has_attached_file :picture, styles: { medium: "320x150#", thumb: "100x100>"},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # gem money-rails 
  monetize :price_cents
  
  # scopes
  scope :ads_by_descending_order, -> (quantity =10) { 
    limit(quantity).order(created_at: :desc)
  }
  scope :ads_by_current_member, -> (member) { where(member: member) }
end
