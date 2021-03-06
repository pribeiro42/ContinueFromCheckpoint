require 'rails_helper'

RSpec.describe GamePurchase, type: :model do
  subject(:game_purchase) { FactoryBot.create(:game_purchase) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(game_purchase).to be_valid
    end

    it { should validate_length_of(:comment).is_at_most(500) }
    it { should validate_uniqueness_of(:game_id).scoped_to(:user_id) }
  end

  describe "Associations" do
    it { should belong_to(:game) }
    it { should belong_to(:user) }
  end
end
