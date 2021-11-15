require 'rails_helper'

RSpec.describe "filmographies#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/filmographies", params: params
  end

  describe 'basic fetch' do
    let!(:filmography1) { create(:filmography) }
    let!(:filmography2) { create(:filmography) }

    it 'works' do
      expect(FilmographyResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['filmographies'])
      expect(d.map(&:id)).to match_array([filmography1.id, filmography2.id])
    end
  end
end
