require 'spec_helper'

describe 'keyremap4macbook::cli' do
  cli = '/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli'

  context 'with defaults' do
    let(:title) { 'list' }

    it do
      should include_class('keyremap4macbook::config')

      should contain_exec('keyremap4macbook::cli::list').with({
        :command => "#{cli} list",
        :require => 'Package[KeyRemap4MacBook]'
      })
    end
  end

  context 'with command set to select 1' do
    let(:title) { 'foobar' }
    let(:params) do
      {
        :command => 'select 1'
      }
    end

    it do
      should contain_exec('keyremap4macbook::cli::select 1').with({
        :command => "#{cli} select 1",
        :require => 'Package[KeyRemap4MacBook]'
      })
    end
  end
end
