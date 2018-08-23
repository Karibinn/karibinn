# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Localizable do
  let(:dummy_class) do
    Struct.new(:name_en, :name_fr) do
      include Localizable

      localizable :name
    end
  end

  let(:dummy) { dummy_class.new('Good Morning', 'Bonjour') }

  it 'uses correct translation for EN locale' do
    expect(dummy.name(:en)).to eq 'Good Morning'
  end

  it 'uses correct translation for fr locale' do
    expect(dummy.name(:fr)).to eq 'Bonjour'
  end

  it 'falls back to default locale when locale doesnt exist' do
    expect(I18n).to receive(:default_locale).and_return :en

    expect(dummy.name(:de)).to eq 'Good Morning'
  end

  context 'when the expected locale is empty' do
    before do
      allow(I18n).to receive(:default_locale).and_return :en
    end

    context 'and its not the default locale' do
      let(:dummy) { dummy_class.new('Good Morning', '') }

      it 'falls back to default locale' do
        expect(dummy.name(:fr)).to eq 'Good Morning'
      end
    end

    context 'and it is the default locale' do
      let(:dummy) { dummy_class.new('', 'Bonjour') }

      it 'returns an empty string' do
        expect(dummy.name(:en)).to eq ''
      end
    end
  end
end
