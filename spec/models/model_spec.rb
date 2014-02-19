describe Model do
  before(:each) do
    Webtrends::Event.stub(:track)
  end

  context 'successfull load' do
    context 'after validation' do
      it 'should respond to track event' do
        subject.some_attribute = 'cupcake'
        expect(subject).to receive(:track_event)
        subject.save
      end
    end
  end

  context 'usuccessfull load' do
    context 'after validation' do
      it 'should not respond to track event' do
        expect(subject).to_not receive(:track_event)
        subject.save
      end
    end
  end
end