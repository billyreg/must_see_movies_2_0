require "rails_helper"

RSpec.describe "filmographies#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/filmographies/#{filmography.id}"
  end

  describe "basic destroy" do
    let!(:filmography) { create(:filmography) }

    it "updates the resource" do
      expect(FilmographyResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Filmography.count }.by(-1)
      expect { filmography.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
