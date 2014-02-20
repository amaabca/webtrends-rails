describe Model do
  context 'successfull load' do
    context 'after validation' do
      it 'should respond to track event' do
        subject.some_attribute = 'cupcake'
        expect_any_instance_of(Webtrends::Event).to receive(:track)
        subject.save
      end
    end
  end

  context 'usuccessfull load' do
    context 'after validation' do
      it 'should not respond to track event' do
        expect_any_instance_of(Webtrends::Event).to_not receive(:track)
        subject.save
      end
    end
  end
end