require 'rails_helper'

RSpec.describe "filmographies#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/filmographies/#{filmography.id}", params: params
  end

  describe 'basic fetch' do
    let!(:filmography) { create(:filmography) }

    it 'works' do
      expect(FilmographyResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('filmographies')
      expect(d.id).to eq(filmography.id)
    end
  end
end
