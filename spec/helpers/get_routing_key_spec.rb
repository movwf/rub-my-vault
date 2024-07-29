require 'rspec'
require_relative '../../helpers/get_routing_key'

RSpec.describe do
  describe '.get_routing_key' do
    it 'returns a routing key in the correct format' do
      method = :GET
      path = '/home'
      expected_key = 'GET::/home'
      result = get_routing_key(method, path)
      expect(result).to eq(expected_key)
    end

    it 'handles symbols for method and path' do
      method = :POST
      path = :login
      expected_key = 'POST::login'
      result = get_routing_key(method, path)
      expect(result).to eq(expected_key)
    end

    it 'handles strings for method and path' do
      method = 'PUT'
      path = 'update'
      expected_key = 'PUT::update'
      result = get_routing_key(method, path)
      expect(result).to eq(expected_key)
    end

    it 'handles empty strings for path' do
      method = :DELETE
      path = ''
      expected_key = 'DELETE::'
      result = get_routing_key(method, path)
      expect(result).to eq(expected_key)
    end
  end
end