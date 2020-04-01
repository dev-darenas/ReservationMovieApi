RSpec.describe Movie, type: :model do
  describe "Save movie" do
    it "is valid with valid attributes" do
      expect(build(:movie)).to be_valid
    end

    it "is invalid without requiered attributes" do
      expect(build(:invalid_movie)).to_not be_valid
    end
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

  describe "Associations" do
    it { should have_many(:reservations) }
  end
end
