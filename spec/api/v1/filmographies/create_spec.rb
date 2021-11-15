require 'rails_helper'

RSpec.describe "filmographies#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/filmographies", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'filmographies',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(FilmographyResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Filmography.count }.by(1)
    end
  end
end
