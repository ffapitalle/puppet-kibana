require 'spec_helper'

describe 'kibana' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context 'kibana class without any parameters' do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kibana::repo') }
          it { is_expected.to contain_class('kibana::install') }
          it { is_expected.to contain_class('kibana::config') }
          it { is_expected.to contain_class('kibana::service') }

          it { is_expected.to contain_service('kibana') }
          it { is_expected.to contain_package('kibana').with_ensure('present') }
        end
      end
    end
  end
end
