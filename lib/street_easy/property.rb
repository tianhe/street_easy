require 'open-uri'
require 'json'
require 'recursive_open_struct'

module StreetEasy
  class Property < Client
    @sales_or_rental = 'rentals'

    class << self
      def neighborhoods(*neighborhood)
        @neighborhoods = neighborhood.join(',') if neighborhood.kind_of?(Array)
        @neighborhoods = neighborhood           if neighborhood.kind_of?(String)
        self
      end

      def rentals
        @sales_or_rental = 'rentals'
        self
      end

      def sales
        @sales_or_rental = 'sales'
        self
      end

      def order(sort_type)
        case sort_type
          when :most_expensive  then @order = "price_desc"
          when :least_expensive then @order = "price_asc"
          when :newest          then @order = "listed_desc"
        end
        self
      end

      def limit(limit)
        @limit = limit
        get_properties
      end

      def all
        @limit = 200 # the api limit
        get_properties
      end

      private

      def get_properties
        uri = StreetEasy::Client.construct_url(@sales_or_rental, @neighborhoods, {
          limit: @limit,
          order: @order,
          beds: @beds,
          building: @building,
          monthly: @monthly,
          price: @price,
          ppsf: @ppsf,
          sqft: @sqft,
          type: @type,
          status: @status,
          commute: @commute
        })

        response = uri.read
        parsed_response = JSON.parse(response)
        RecursiveOpenStruct.new(parsed_response, recurse_over_arrays: true)
      end
    end
  end
end