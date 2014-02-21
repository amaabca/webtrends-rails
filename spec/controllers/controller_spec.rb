describe TestsController do
  before(:each) do
    Webtrends::Event.stub(:track)
  end

  describe '.analytics_visitor_id' do
    it 'will be called when a tracked action occurs' do
      expect(subject).to receive(:analytics_visitor_id)
      get :index
    end

    context 'webtrends client cookie is present' do
      it 'will return the visitor id' do
        request.cookies['WT_FPC'] = 'id=some_id-9ew8r09t7:x=vlkhrpe-ryg8u4387'
        get :index
        expect(subject.model.webtrends_tags['WT.co_f']).to eq('some_id-9ew8r09t7')
      end
    end

    context 'webtrends client cookie is not present' do
      it 'will return an empty string' do
        get :index
        expect(subject.model.webtrends_tags['WT.co_f']).to eq('')
      end
    end
  end

  context '#analytics_tags' do
    it 'returns default analytics tags' do
      get :index
      expect(subject.model.webtrends_tags).to_not be_empty
    end
  end
end