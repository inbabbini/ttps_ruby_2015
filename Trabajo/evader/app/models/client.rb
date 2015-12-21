class Client < ActiveRecord::Base
  has_many :bills
  has_many :people, through: :bills

  # Model validations
  validates :first_name, :last_name,
    format: /\A[^0-9`!@#\$%\^&*+_=]+\z/,
    length: {minumum: 2, maximum: 50},
    presence: true

  validates :dni,
    presence: true,
    format:  /\A[0-9]+\z/,
    length: { minimum: 6, maximum: 8 }

  validates :gender,
    inclusion: { in: %w(male female) },
    presence: true

  validates :cui,
    format: /\A\d{2}\-\d{8}\-\d{1}\z/,
    presence: true

  validates :phone,
    format: /([\w\-\']{2,})([\s]+)([\w\-\']{2,})/,
    presence:true

  validates :mail,
    format: /@/,
    presence: true

  validates :address,
    length: { minimum: 4, maximum: 255 },
    presence: true

  def to_s
    "#{self.first_name} #{self.last_name}"
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthdate.year - (birthdate.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def amount_billed_per_year
    self.bills
    .select("strftime('%Y', emission_date) as emission_year, SUM(amount) as yearly_amount")
    .group("strftime('%Y', emission_date)")
    .order("strftime('%Y', emission_date)")
  end

  def emmited_bills_amount_per_month
    self.bills
    .select("strftime('%m', emission_date) as emission_month, SUM(amount) as monthly_amount")
    .where("strftime('%Y', emission_date) = ? ", Time.now.year.to_s )
    .group("strftime('%m', emission_date)")
    .order("strftime('%m', emission_date)")
  end

  def most_billed_people
    self.people
    .select("name, COUNT(*) as bills_amount")
    .group('name')
    .order('bills_amount DESC')
  end

end
