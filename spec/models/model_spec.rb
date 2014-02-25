describe Model do
  context 'valid model attributes' do
    context 'after validation' do
      it 'will track the event' do
        subject.some_attribute = 'cupcake'
        expect_any_instance_of(Webtrends::Event).to receive(:track)
        subject.save
      end
    end
  end

  context 'invalid model attributes' do
    context 'after validation' do
      it 'will not track the event' do
        expect_any_instance_of(Webtrends::Event).to_not receive(:track)
        subject.save
      end
    end
  end
end