require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Creating a client without contact data" do

    client = Client.new(
      first_name: "Elsa",
      last_name: "Payo",
      birthdate: Date.new(1978,11,23),
      dni: 23444555,
      gender: "female",
      cui: "30-23333333-2"
    )
    assert(client.save, "Client should be saved successfully")

  end

  test "Creating a client with contact data" do

    client = Client.new(
      first_name: "Bruce",
      last_name: "Wayne",
      birthdate: Date.new(1982,06,10),
      dni: 36571600,
      gender: "male",
      cui: "20-66666666-1"
    )
    contact_data = Contact.new(
      medium: "mail",
      value: "bruce@wayne.com"
    )

    client.contacts << contact_data
        assert(client.save, "Client should be saved successfully")

  end

  test "Creating a client with invalid data" do

    client = clients(:three)
    refute(client.save, "Client should not be saved")

  end

  test "Deleting a client without regitered bills" do

    client = clients(:four)
    client.save
    assert(client.destroy, "Client should be deleted successfully")


  end

  test "Deleting a client with regitered bills" do

    client = clients(:two)
    client.save
    refute(client.destroy, "Client should not be deleted")

  end

end
