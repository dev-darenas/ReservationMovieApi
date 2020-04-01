RSpec.describe Reservation, type: :model do  
  subject { build(:reservation) }

  describe "Validations" do
    it { should validate_presence_of(:reservation_date) }
  end

  describe "Associations" do
    it { should belong_to(:movie) }
    it { should belong_to(:customer) }
  end

  describe "validate count reservations" do
    let(:reservation) { build(:invalid_reservation) }

    it "should be invalid because of the number of reservation is greater than 10" do
      expect(reservation.save).to eq(false)
    end
  end
end
