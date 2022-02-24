# frozen_string_literal: true

control 'SFTP configuration' do
  title 'should match desired lines'

  describe file('/etc/proftpd/sftp.conf') do
    it { should be_file }
    its('content') { should include '## File managed by Salt' }
    its('content') { should include 'SFTPEngine' }
    its('content') { should include 'SFTPLog' }
    its('content') { should include 'SFTPOptions' }
    its('content') { should include 'SFTPHostKeyrsa' }
    its('content') { should include 'SFTPAuthMethods' }
    its('content') { should include 'SFTPAuthorizedUserKeys' }
    its('content') { should include 'SFTPCompression' }
  end

  describe file('/etc/proftpd/proftpd.conf') do
    it { should be_file }
    its('content') { should include 'Include /etc/proftpd/sftp.conf' }
  end

  describe file('/etc/proftpd/modules.conf') do
    it { should be_file }
    its('content') { should include '## File managed by Salt' }
    its('content') { should include 'LoadModule mod_sftp.c' }
  end
end
