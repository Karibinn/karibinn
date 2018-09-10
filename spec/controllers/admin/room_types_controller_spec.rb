# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::RoomTypesController, type: :controller do
  let(:property) { create :property }

  let(:valid_attributes) do
    attributes_for(:room_type).merge({ property_id: property.id })
  end

  let(:invalid_attributes) do
    { guest_capacity: 0 }
  end

  before do
    sign_in(create(:user, :admin))
  end

  describe 'GET #index' do
    it 'returns a success response' do
      room_type = RoomType.create! valid_attributes
      get :index, params: { property_id: property.id }

      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { property_id: property.id }
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      room_type = RoomType.create! valid_attributes
      get :edit, params: { property_id: property.id, id: room_type.to_param }

      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new RoomType' do
        expect {
          post :create, params: { property_id: property.id, room_type: valid_attributes }
        }.to change(RoomType, :count).by(1)
      end

      it 'redirects to the created room_type' do
        post :create, params: { property_id: property.id, room_type: valid_attributes }

        expect(response).to redirect_to(admin_property_room_types_path)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { property_id: property.id, room_type: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { guest_capacity: 20, bedrooms: 10, double_beds: 5, single_beds: 7,
          baths: 1, name_en: 'hello123', name_fr: 'bonjour123' }
      end

      it 'updates the requested room_type' do
        room_type = RoomType.create! valid_attributes

        put :update, params: {
          property_id: property.id, id: room_type.to_param, room_type: new_attributes
        }

        room_type.reload

        expect(room_type.guest_capacity).to eq 20
        expect(room_type.bedrooms).to eq 10
        expect(room_type.double_beds).to eq 5
        expect(room_type.single_beds).to eq 7
        expect(room_type.baths).to eq 1
        expect(room_type.name_en).to eq 'hello123'
        expect(room_type.name_fr).to eq 'bonjour123'
      end

      it 'redirects to the room_type' do
        room_type = RoomType.create! valid_attributes

        put :update, params: {
          property_id: property.id, id: room_type.to_param, room_type: valid_attributes
        }

        expect(response).to redirect_to(admin_property_room_types_path)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        room_type = RoomType.create! valid_attributes

        put :update, params: {
          property_id: property.id, id: room_type.to_param, room_type: invalid_attributes
        }

        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested room_type' do
      room_type = RoomType.create! valid_attributes
      expect {
        delete :destroy, params: { property_id: property.id, id: room_type.to_param }
      }.to change(RoomType, :count).by(-1)
    end

    it 'redirects to the room_types list' do
      room_type = RoomType.create! valid_attributes
      delete :destroy, params: { property_id: property.id, id: room_type.to_param }
      expect(response).to redirect_to(admin_property_room_types_path)
    end
  end
end
