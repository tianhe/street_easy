module StreetEasy
  class Client
    BASE_URI = "www.streeteasy.com/nyc/api/"

    def self.api_key
      @api_key
    end

    def self.api_key=(key)
      @api_key = key
    end

    def self.construct_url(sales_or_rental, neighborhood, optional_params)
      full_params = { area: neighborhood, key: @api_key }.merge(optional_params).compact.try(:to_param)      
      uri = URI("http://#{BASE_URI}/#{sales_or_rental}/search?criteria=#{full_params}&format=json")
    end
  end
end