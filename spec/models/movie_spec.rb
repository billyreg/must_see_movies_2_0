require 'rails_helper'

RSpec.describe Movie, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:reviews) }

    it { should have_many(:bookmarks) }

    it { should have_many(:filmographies) }

    it { should have_many(:roles) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
