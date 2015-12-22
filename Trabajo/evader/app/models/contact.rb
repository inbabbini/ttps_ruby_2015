class Contact < ActiveRecord::Base
  belongs_to :client

  enum mediums: { 'phone' => 'phone', 'mail' => 'mail', 'address' => 'address', 'skype' => 'skype' }

  #model validations
  validates :client, :medium, :value,
    presence: true

  #phone validation
  validates :value,
    format: /([\w\-\']{2,})([\s]+)([\w\-\']{2,})/,
    presence: true,
    if: "medium == 'phone'"

  #mail validation
  validates :value,
    format: /@/,
    presence: true,
    if: "medium == 'mail'"

  #address validation
  validates :value,
    length: { minimum: 4, maximum: 255 },
    presence: true,
    if: "medium == 'address'"

  #skype validation
  validates :value,
    length: { minimum: 4, maximum: 255 },
    presence: true,
    if: "medium == 'skype'"

end
