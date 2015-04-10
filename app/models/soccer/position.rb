class Soccer::Position
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name, type: String
  slug :name

  field :abbreviation, type: String

  field :icon, type: String
  mount_uploader :icon, Soccer::PositionUploader

end
