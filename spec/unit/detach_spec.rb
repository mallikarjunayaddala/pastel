# coding: utf-8

require 'spec_helper'

RSpec.describe Pastel, '.detach' do

  subject(:pastel) { described_class.new(enabled: true) }

  it "detaches colors combination" do
    error = pastel.red.bold.detach
    expect(error.call('unicorn')).to eq("\e[31;1municorn\e[0m")
    expect(error.call('error')).to eq("\e[31;1merror\e[0m")
  end

  it "calls detached colors with no arguments" do
    warning = pastel.yellow.detach
    expect(warning.call('')).to eq('')
  end

  it "inspects detached colors" do
    warning = pastel.yellow.bold.detach
    expect(warning.inspect).to eq('#<Pastel::Detached styles=[:yellow, :bold]>')
  end

  it "accepts multiple strings" do
    error = pastel.red.bold.detach
    expect(error.call('Unicorns', ' run ', 'wild')).
      to eq("\e[31;1mUnicorns run wild\e[0m")
  end
end
