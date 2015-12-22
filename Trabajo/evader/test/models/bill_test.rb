require 'test_helper'

class BillTest < ActiveSupport::TestCase

  test "Creating a new bill with invalid data" do

    client = clients(:three)
    person = people(:one)

    bill = Bill.new(
      description: 123123,
      amount: "a lot of fucking money",
      emission_date: Date.new(1000,11,11)
    )
    bill.client = client
    bill.person = person

    refute(bill.save, "Bill should not be saved")
  end

  test "Creating a new bill with valid data" do

    client =  clients(:one)
    person = people(:two)
    bill = Bill.new(
      description: "500 Batarangs",
      amount: 5000,
      emission_date: Date.new(2015,11,29)
    )
    bill.client = client
    bill.person = person

    assert(bill.save, "Bill should be saved successfully")
  end

end
