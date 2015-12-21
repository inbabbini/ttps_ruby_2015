class Bill < ActiveRecord::Base
  belongs_to :client
  belongs_to :person

  #Model validations

  validates :client, :person,
    presence:true

  validates :description,
    length: {minumum: 2, maximum: 255},
    presence: true

  validates :amount,
    numericality: { greater_than_or_equal_to: 0.00},
    presence: true

  validates :emission_date,
    presence: true

end
