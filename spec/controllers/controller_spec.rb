describe TestsController do
  before(:each) do
    Webtrends::Event.stub(:track)
  end

  context 'successfull load' do
    context '#analytics visitor id' do
      it 'should respond to method' do
        expect(subject).to receive(:analytics_visitor_id)
        get :index
      end

      context 'cookie is present' do
        it 'should return the id' do
          request.cookies['WT_FPC'] = 'id=some_id-9ew8r09t7:vlkhrpe-ryg8u4387'
          get :index
          expect(subject.model.webtrends_tags['WT.co_f']).to eq('some_id-9ew8r09t7')
        end
      end

      context 'cookies is not present' do
        it 'should return empty string' do
          get :index
          expect(subject.model.webtrends_tags['WT.co_f']).to eq('')
        end
      end
    end

    context '#analytics_tags' do
      it 'should return tags' do
        get :index
        expect(subject.model.webtrends_tags).to_not be_empty
      end
    end
  end
end