class Client < ActiveRecord::Base
  has_many :bills

  # validates :first_name, :last_name, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates_format_of :full_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/

  validates_format_of :phone_number, :with => /([\w\-\']{2,})([\s]+)([\w\-\']{2,})/

  # validates_format_of :dni, :with => /^[0-9]+$/

  validates :email, presence: true
  validates_format_of :email, :with => /@/

  validates :gender, inclusion: { in: %w(male female) }
end
