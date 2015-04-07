class Soccer::Player
  include Mongoid::Document
  include Mongoid::Timestamps

  field :unique_id, type: String
  field :first_name, type: String
  field :last_name, type: String

  belongs_to :app, :class_name => "Business::App"

  def name
    "#{first_name} #{last_name}"
  end

end
