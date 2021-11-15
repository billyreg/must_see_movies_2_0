require 'rails_helper'

RSpec.describe FilmographyResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'filmographies',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FilmographyResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Filmography.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:filmography) { create(:filmography) }

    let(:payload) do
      {
        data: {
          id: filmography.id.to_s,
          type: 'filmographies',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FilmographyResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { filmography.reload.updated_at }
      # .and change { filmography.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:filmography) { create(:filmography) }

    let(:instance) do
      FilmographyResource.find(id: filmography.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Filmography.count }.by(-1)
    end
  end
end
