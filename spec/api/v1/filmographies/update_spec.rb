require 'rails_helper'

RSpec.describe "filmographies#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/filmographies/#{filmography.id}", payload
  end

  describe 'basic update' do
    let!(:filmography) { create(:filmography) }

    let(:payload) do
      {
        data: {
          id: filmography.id.to_s,
          type: 'filmographies',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FilmographyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { filmography.reload.attributes }
    end
  end
end
