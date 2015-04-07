class Business::App
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  before_create :generate_access_token

  field :access_token, type: String

  field :name, type: String
  slug :name

  field :description, type: String


  private

   def generate_access_token
      self.access_token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless self.class.where(access_token: random_token).nil?
      end
   end


end
