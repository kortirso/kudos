# frozen_string_literal: true

describe Kudos do
  let(:operator) { Class.new.send(:include, described_class) }

  it 'has a version number' do
    expect(Kudos::VERSION).not_to be_nil
  end
end
