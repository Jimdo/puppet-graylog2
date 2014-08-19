require 'spec_helper'

describe 'graylog2::server' do

  let(:facts) {
    {
      'osfamily' => 'Debian'
    }
  }

  it 'should not override the DAEMON_ARGS if not max heap size is defined' do
    should contain_file('/etc/default/graylog2-server').without_content(/DAEMON_ARGS/)
  end

  context do
    let(:params) {
      {
        'max_heap_size' => '4096M'
      }
    }

    it 'should set the max heap size, to the provided value' do
      should contain_file('/etc/default/graylog2-server').with_content(/^DAEMON_ARGS="-Xms4096M -Xmx4096M -jar .*"$/)
    end
  end
end
