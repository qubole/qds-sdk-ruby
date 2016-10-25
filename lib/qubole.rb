require "qubole/version"
require "qubole/exceptions"
require "qubole/commands"
require "qubole/cluster"
require "net/http"
require "json"

module Qubole
  ACCESS_URL = 'https://api.qubole.com/api/'
  API_VERSION = 'v1.2'

  class << self
    attr_accessor :api_token, :version

    # 
    # API version
    # 
    # @return [String] API version used
    def version
      @version || API_VERSION
    end

    # 
    # Configure Qubole
    # @param params [Hash] configuration parameters
    # @option params [String] :api_token Qubole API token
    # @option params [String] :version Qubole API version (v1.2 be default)
    # 
    def configure(params)
      self.api_token = params[:api_token]
      self.version = params[:version]
    end

    # 
    # Request headers
    # 
    # @return [Hash] request headers
    def headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'X-AUTH-TOKEN' => @api_token
      }
    end

    # 
    # HTTP request to Qubole
    # @param path [String] API path
    # @param params [Hash] GET parameters
    # @yieldparam [Net::HTTP] http HTTP connection
    # @yieldparam [URI] uri request URI
    # 
    # @return [Hash|Array] parsed JSON response
    def http(name, path, params)
      # Build URI
      uri = URI(ACCESS_URL + version)
      uri.path += path

      # Encode parameters for GET request
      if name == 'GET'
        uri.query = URI.encode_www_form(params)
      else
        # Stringify JSON for all other requests
        data = JSON.generate(params) unless params.empty?
      end

      # Open connection
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        # Execute request
        http.send_request(name, uri, data, headers)
      end

      # Raise error message if not success
      raise HttpException.new(res) unless res.is_a? Net::HTTPSuccess
      # Parse JSON body
      JSON.parse(res.body) rescue res.body
    end

    # Defining HTTP methods for Qubole
    %w(get post put delete).each do |name|
      define_method(name) do |path, params = {}|
        http(name.upcase, path, params)
      end
    end
  end
end
