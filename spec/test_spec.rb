# frozen_string_literal: true

require 'rack/test'
require 'simple_web_app/api/application'

RSpec.describe 'API' do
  include Rack::Test::Methods

  subject(:response) { get '/' }
  let(:app) { SimpleWebApp::API::Application }

  describe 'GET /' do
    specify do
      expect(response.status).to eq 200
      expect(response.body).to eq <<~JSON.strip
        [{"id":1,"number":"ticket#1"},{"id":2,"number":"ticket#2"}]
      JSON
    end
  end
end
