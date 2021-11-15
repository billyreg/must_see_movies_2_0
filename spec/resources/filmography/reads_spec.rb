require 'rails_helper'

RSpec.describe FilmographyResource, type: :resource do
  describe 'serialization' do
    let!(:filmography) { create(:filmography) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(filmography.id)
      expect(data.jsonapi_type).to eq('filmographies')
    end
  end

  describe 'filtering' do
    let!(:filmography1) { create(:filmography) }
    let!(:filmography2) { create(:filmography) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: filmography2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([filmography2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:filmography1) { create(:filmography) }
      let!(:filmography2) { create(:filmography) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            filmography1.id,
            filmography2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            filmography2.id,
            filmography1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
