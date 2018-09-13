# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::LocationsController, type: :controller do

  let(:valid_attributes) { attributes_for(:location) }

  let(:invalid_attributes) { { name_en: '' } }

  before do
    sign_in(create(:user, :admin))
  end

  describe "GET #index" do
    it "returns a success response" do
      location = Location.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      location = Location.create! valid_attributes
      get :edit, params: { id: location.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Location" do
        expect do
          post :create, params: { location: valid_attributes }
        end.to change(Location, :count).by(1)
      end

      it "redirects to the created location" do
        post :create, params: { location: valid_attributes }
        expect(response).to redirect_to(admin_location_path(Location.last))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { location: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          name_en: 'MyName',
          name_fr: 'MyFrName',
          description_en: 'MyEnDesc',
          description_fr: 'MyDescFre',
          small_image: fixture_file_upload('files/image1.jpg'),
          large_image: fixture_file_upload('files/image2.jpg')
        }
      end

      it "updates the requested location" do
        location = Location.create! valid_attributes
        put :update, params: { id: location.to_param, location: new_attributes }
        location.reload

        expect(location.name_en).to eq 'MyName'
        expect(location.name_fr).to eq 'MyFrName'
        expect(location.description_en).to eq 'MyEnDesc'
        expect(location.description_fr).to eq 'MyDescFre'
        expect(location.small_image).to be_present
        expect(location.large_image).to be_present
      end

      it "redirects to the location" do
        location = Location.create! valid_attributes
        put :update, params: { id: location.to_param, location: valid_attributes }
        expect(response).to redirect_to(admin_location_path(location))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        location = Location.create! valid_attributes
        put :update, params: { id: location.to_param, location: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested location" do
      location = Location.create! valid_attributes
      expect {
        delete :destroy, params: { id: location.to_param }
      }.to change(Location, :count).by(-1)
    end

    it "redirects to the locations list" do
      location = Location.create! valid_attributes
      delete :destroy, params: { id: location.to_param }
      expect(response).to redirect_to(admin_locations_url)
    end
  end

end
