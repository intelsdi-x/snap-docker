require 'rspec/retry'
require 'dockerspec/serverspec'

RSpec.configure do |c|
  c.formatter = 'documentation'
  c.mock_framework = :rspec
  c.verbose_retry = true
end

shared_examples "metadata" do
  it { should have_maintainer /Nan Liu/ }

  %w[SNAP_VERSION SNAP_TRUST_LEVEL SNAP_LOG_LEVEL].each do |e|
    it { should have_env e }
  end

  { "vendor" => "Intelsdi-X",
    "license" => "Apache 2.0",
    "build-date" => "",
    "io.snap-telemetry.snap.version.is-beta" => "", 
  }.each do |k, v|
    it { should have_label( k => v ) }
  end

  it { should have_expose '8181' }
  it { should have_cmd ["/bin/sh", "-c", "/usr/local/bin/init_snap && /opt/snap/bin/snapd -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''"] }
end

shared_examples "snap containers" do |os|
  # NOTE: some containers are missing the ss command, and we do not want to install the packages dependencies
  if ['centos7', 'centos7_test', 'precise', 'precise_test',  'xenial', 'xenial_test'].include? os
    options = { port_check: false }
  else
    options = { port_check: true }
  end

  # NOTE: GH-9 running init_snap again should not cause any errors
  describe command('/usr/local/bin/init_snap') do
    its(:exit_status) { should eq 0 }
  end

  bins = [
    "/opt/snap/bin/snapctl",
    "/opt/snap/bin/snapd",
    "/usr/local/bin/init_snap",
  ]

  bins.each do |f|
    describe file(f) do
      it { should be_file }
      it { should be_executable }
    end
  end

  symlinks = [
    "/usr/local/bin/snapctl",
    "/usr/local/bin/snapd",
  ]

  symlinks.each do |f|
    describe file(f) do
      it { should be_symlink }
      it { should be_linked_to f.gsub("/usr/local/bin", "/opt/snap/bin") }
    end
  end

  folders = [
    "/opt/snap/bin",
    "/opt/snap/plugins",
    "/var/log/snap",
    "/etc/snap",
  ]

  folders.each do |f|
    describe file(f) do
      it { should be_directory }
    end
  end

  describe file('/var/log/snap/snapd.log') do
    it { should be_file }
    its(:content) { should match /snapd started/ }
  end if options[:log_check]

  describe file('/etc/snap/snapd.conf') do
    it { should be_file }
    its(:content_as_yaml) {
      should include('log_path' => '/var/log/snap')
      should include('control' => {
        "auto_discover_path" => "/opt/snap/plugins",
        "plugin_trust_level" => 0,
      })
    }
  end

  describe port('8181'), :retry => 3, :retry_wait => 10 do
    it { should be_listening }
  end if options[:port_check]

  describe command('/opt/snap/bin/snapd --version') do
    its(:stdout) { should match /snapd version/ }
  end

  describe command('/opt/snap/bin/snapctl --version'),:retry => 3, :retry_wait => 10 do
    its(:stdout) { should match /snapctl version/ }
  end
end
