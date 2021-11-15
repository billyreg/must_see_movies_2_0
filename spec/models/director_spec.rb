require "rails_helper"

RSpec.describe Director, type: :model do
  describe "Direct Associations" do
    it { should have_many(:filmographies) }
  end

  describe "InDirect Associations" do
    it { should have_many(:filmography) }
  end

  describe "Validations" do
  end
end
