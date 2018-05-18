require 'spec_helper'

if ENV["BUILD_OS"]
  BUILDS = ENV["BUILD_OS"].split(" ")
else
  BUILDS = %w[alpine centos6 centos7 precise trusty xenial bionic alpine_test centos6_test centos7_test precise_test trusty_test xenial_test bionic_test]
end

BUILDS.each do |os|
  if os =~ /_test$/
    describe "snap on #{os}" do
      describe docker_build("#{os}/.") do
        include_examples "metadata"

        it { should have_label( "io.snap-telemetry.snap.version" => "latest_build" ) }

        describe docker_run(described_image) do
          # NOTE: some platforms are missing packages for the ss command, and we do not want to install this requirement
          it_behaves_like "snap containers", os

          describe package("bash") do
            it { should be_installed }
          end

          describe package("curl") do
            it { should be_installed }
          end

          case os
          when "alpine", "trusty_test", "xenial_test", "bionic_test"
            describe package("jq") do
              it { should be_installed }
            end
          else
            describe file("/usr/bin/jq") do
              it { should be_file }
              it { should be_executable }
            end
          end
        end
      end
    end
  else
    describe "snap on #{os}" do
      describe docker_build("#{os}/.") do
        include_examples "metadata"

        it { should have_env "CI_URL" }
        it { should have_label( "io.snap-telemetry.snap.version" => "latest" ) }

        describe docker_run(described_image) do
          it_behaves_like "snap containers", os
        end
      end
    end
  end
end
