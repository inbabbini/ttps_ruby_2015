class Person < ActiveRecord::Base
  has_many :bills

  validates :name,
    format: /\A[^0-9`!@#\$%\^&*+_=]+\z/,
    length: {minumum: 2, maximum: 50},
    presence: true

  validates :cui,
    format: /\A\d{2}\-\d{8}\-\d{1}\z/,
    presence: true

  def to_s
    "#{self.name}" 
  end

end
