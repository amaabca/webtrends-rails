class Model
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveRecord::Callbacks
  extend ActiveModel::Naming
  include Webtrends::Rails::Model

  attr_accessor :some_attribute

  validates :some_attribute, presence: true

  after_validation :track_event, if: 'errors.blank?'

  def attributes=(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def save
    errors.add(:base, 'Error') unless valid?
  end
end