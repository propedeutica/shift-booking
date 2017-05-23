require 'rails_helper'

RSpec.describe 'Information', type: :request do
  describe 'when not authenticated' do
    it 'should get info' do
      get information_info_path
      expect(response).to have_http_status(200)
    end
    it 'should get about' do
      get information_about_path
      expect(response).to have_http_status(200)
    end
  end
end
