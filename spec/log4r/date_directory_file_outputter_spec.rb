RSpec.describe Log4r::DateDirectoryFileOutputter do
  before do
    Timecop.freeze(2018, 1, 23)
  end

  let(:params) {
    {
      file_path: '/tmp/%Y/%m/%d/request.log',
      trunc: 'false'
    }
  }

  it 'should be directory file path' do
    outputter = described_class.new('logfile', params)
    file_path = outputter.instance_variable_get(:@out).path
    expect(file_path).to eq('/tmp/2018/01/23/request.log')
  end

  it 'should change directory file path' do
    outputter = described_class.new('logfile', params)
    Timecop.freeze(2018, 1, 24)
    file_path = outputter.instance_variable_get(:@out).path
    expect(file_path).to eq('/tmp/2018/01/23/request.log')
    outputter.send(:write, 'test')
    file_path = outputter.instance_variable_get(:@out).path
    expect(file_path).to eq('/tmp/2018/01/24/request.log')
  end
end
