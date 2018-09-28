# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductRepository do
  subject { described_class }

  describe '.search_properties' do
    subject { described_class.search_properties(search_form) }

    context 'with no filters' do
      let(:search_form) { PropertySearchForm.new }

      it 'returns all properties with images' do
        product1 = create :product, :with_property, :with_image
        product2 = create :product, :with_property, :with_image
        product3 = create :product, :with_property

        expect(subject).to match_array([product1, product2])
      end
    end

    context 'with phrase filter' do
      let(:search_form) { PropertySearchForm.new(phrase: 'villa') }

      it 'includes only properties with given phrase in their title' do
        prod1 = create :product, :with_property, :with_image, title_en: 'Amazing Villa'
        _prod2 = create :product, :with_property, :with_image, title_en: 'Pretty Bungalow'
        prod3 = create :product, :with_property, :with_image, title_fr: 'Villa Fantastic!'

        expect(subject).to match_array([prod1, prod3])
      end
    end

    context 'with guests filter' do
      let(:search_form) { PropertySearchForm.new(guests: 5) }

      it 'includes only properties with room types that can accomodate at least that amount' do
        prod1 = create :product, :with_property, :with_image
        prod2 = create :product, :with_property, :with_image
        prod3 = create :product, :with_property, :with_image

        create :room_type, property: prod1.property, guest_capacity: 4

        create :room_type, property: prod2.property, guest_capacity: 2
        create :room_type, property: prod2.property, guest_capacity: 5

        create :room_type, property: prod3.property, guest_capacity: 10

        expect(subject).to match_array([prod2, prod3])
      end
    end

    context 'with home type filter' do
      let(:category1) { create :category }
      let(:category2) { create :category }
      let(:search_form) { PropertySearchForm.new(home_type: category1.id) }

      it 'includes only properties with the same category id' do
        prod1 = create :product, :with_property, :with_image, category: category1
        _prod2 = create :product, :with_property, :with_image, category: category2

        expect(subject).to match_array([prod1])
      end
    end

    context 'with location filter' do
      let(:location1) { create :location, name_en: 'Guadeloupe', slug: 'guadeloupe' }
      let(:location2) { create :location, name_en: 'Martinique', slug: 'martinique' }

      let(:search_form) { PropertySearchForm.new(location_slug: location1.slug) }

      it 'includes only properties with given slug' do
        _prod1 = create :product, :with_property, :with_image, location: location2
        prod2 = create :product, :with_property, :with_image, location: location1

        expect(subject).to match_array([prod2])
      end
    end

    context 'with page filter' do
      let(:search_form) { PropertySearchForm.new(per_page: 2) }

      it 'paginates', :aggregate_failures do
        pending 'is this needed?'
        prod1 = create :product, :with_property, :with_image
        prod2 = create :product, :with_property, :with_image
        prod3 = create :product, :with_property, :with_image

        result_page1 = described_class.search_properties(search_form)

        expect(result_page1).to match_array([prod1, prod2])

        search_form.page = 2
        result_page2 = described_class.search_properties(search_form)

        expect(result_page2).to match_array([prod3])

        search_form.page = 3
        result_page3 = described_class.search_properties(search_form)

        expect(result_page3).to be_empty
      end
    end

    context 'with dates' do
      pending
    end

    context 'with guests and home type filters' do
      let(:category1) { create :category }
      let(:category2) { create :category }
      let(:search_form) { PropertySearchForm.new(guests: 5, home_type: category1.id) }

      it 'includes only properties with room types that can accomodate at least that amount' do
        prod1 = create :product, :with_property, :with_image, category: category1
        prod2 = create :product, :with_property, :with_image, category: category1
        prod3 = create :product, :with_property, :with_image, category: category2

        create :room_type, property: prod1.property, guest_capacity: 4

        create :room_type, property: prod2.property, guest_capacity: 2
        create :room_type, property: prod2.property, guest_capacity: 5

        create :room_type, property: prod3.property, guest_capacity: 10

        expect(subject).to match_array([prod2])
      end
    end
  end
end
