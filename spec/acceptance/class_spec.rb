require 'spec_helper_acceptance'

describe 'kibana class' do
  context 'default parameters' do
    describe 'manifest' do
      env = { 'LANG' => 'en_US.UTF-8' }
      pp = <<-EOS
        class { '::kibana': }
      EOS
      it 'applies cleanly ' do
        apply_manifest(pp, catch_failures: true, environment: env)
      end
      it 'is idempotent ' do
        apply_manifest(pp, catch_changes: true, environment: env)
      end
    end
  end
end
