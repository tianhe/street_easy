# StreetEasy API Gem [![Gem Version](https://badge.fury.io/rb/street_easy.svg)](http://badge.fury.io/rb/street_easy)

## Description

A little gem that integrates with the Street Easy API (beta).

API Documentation available [here](http://streeteasy.com/api/info).


## Installation

Add this line to your application's Gemfile:

    gem 'street_easy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install street_easy

## Set Up

First, register for an API key [here](http://streeteasy.com/api/info).

Then, place this code somewhere in your ruby environment.

    require 'street_easy'

add your API key to the client:

    StreetEasy::Client.api_key = 'your_api_key'

## Property

The `StreatEasy::Property` object has the following methods:

* .rentals
* .sales
* .order(order_type)
* .neighborhoods(list_of_neighborhoods)
* .limit(int)
* .all


### Examples
* return the `200` `:most_expensive` `rentals` in all of `'nyc'` (note, the API maxes out at 200)
```ruby
properties = StreetEasy::Property.all
# or
properties = StreetEasy::Property.rentals.all
# or
properties = StreetEasy::Property.rentals.order(:most_expensive).all
```
* return the `200` `:most_expensive` `sales` in all of `'nyc'` (note, the API maxes out at 200)

```ruby
properties = StreetEasy::Property.sales.all
#or
properties = StreetEasy::Property.sales.order(:most_expensive).all
```
* return the `12` `:least_expensive` `rentals` in all of `'nyc'`.

```ruby
properties = StreetEasy::Property.order(:least_expensive).limit(12)
```

* return the `30` `:least_expensive` `rentals` in `'soho'`.
```ruby
properties = StreetEasy::Property.neighborhoods('soho').order(:least_expensive).limit(30)
```
* return the `newest` `rentals` in both `'soho'` AND `'murray-hill'` (limit 200)
```ruby
properties = StreetEasy::Property.neighborhoods('soho', 'murray-hill').order(:newest).all
# or
properties = StreetEasy::Property.neighborhoods(['soho', 'murray-hill']).order(:newest).all
```

* return the `30` `:least_expensive` `sales` in `'soho'`, `'murray hill'`, and the `'lower-east-side'`, but only return their `:price`, `:area_name`, `:description`, and `:floorplan`
```ruby
properties = StreetEasy::Property.sales
  .neighborhoods('soho', 'murray-hill', 'lower-east-side')
  .order(:least_expensive)
  .limit(30)
```

### full list of neighborhoods:
```ruby
  'manhattan'
  'battery-park-city'
  'chelsea'
  'west-chelsea'
  'chinatown'
  'two-bridges'
  'civic-center'
  'east-village'
  'financial-district'
  'fulton/seaport'
  'flatiron'
  'nomad'
  'gramercy-park'
  'greenwich-village'
  'noho'
  'little-italy'
  'lower-east-side'
  'nolita'
  'soho'
  'stuyvesant-town/pcv'
  'tribeca'
  'west-village'
  'all-midtown'
  'central-park-south'
  'midtown'
  'midtown-east'
  'kips-bay'
  'murray-hill'
  'sutton-place'
  'turtle-bay'
  'beekman'
  'midtown-south'
  'midtown-west'
  'roosevelt-island'
  'all-upper-east-side'
  'carnegie-hill'
  'lenox-hill'
  'upper-carnegie-hill'
  'upper-east-side'
  'yorkville'
  'all-upper-west-side'
  'lincoln-square'
  'manhattan-valley'
  'morningside-heights'
  'upper-west-side'
  'all-upper-manhattan'
  'central-harlem'
  'east-harlem'
  'hamilton-heights'
  'inwood'
  'manhattanville'
  'washington-heights'
  'fort-george'
  'hudson-heights'
  'west-harlem'
```

```ruby
  'brooklyn'
  'bedstuy'
  'crown-heights'
  'bushwick'
  'williamsburg'
  'brownsville'
  'stuyvesant-heights'
  'ocean-hill'
  'clinton-hill'
  'dumbo'
  'downtown-brooklyn'
  'boerum-hill'
  'fort-greene'
  'cobble-hill'
  'vinegar-hill'
  'greenpoint'
  'prospect-heights'
  'brooklyn-heights'
  'cswd'
  'carroll-gardens'
  'red-hook'
  'gowanus'
  'park-slope'
  'greenwood'
  'crown-heights'
  'sunset-park'
  'windsor-terrace'
  'prospect-park-south'
  'flatbush'
  'ditmas-park'
  'prospect-lefferts-gardens'
  'northeast-flatbush'
  'east-new-york'
  'canarsie'
  'brownsville'
  'weeksville'
```

```ruby
  'queens'
  'astoria'
  'long-island-city'  
  'sunnyside'
  'woodside'
  'jackson-heights'
  'maspeth'
  'elmhurst'
  'corona'
  'rego-park'
  'little-neck'
```

### unit types
```ruby
  'D1 (condo)'
  'P1 (coops)'
  'X (houses)'
  'M (multi-family)'
  'A (land)'
  '? (other)'
  'Z (auctions)'
```

### amenities
```ruby
  'elevator'
```


### list of .order options
```ruby
  :most_expensive  # default
  :least_expensive
  :newest
```


## Contributing

PLEASE CONTRIBUTE!  This is my first ruby gem, and my first contribution to the open source movement! Therefore, there's a lot of room for improvement :)

TODO:
* tests (oh the travis-ci!)
* error handling
* refactor
* add other classes like `StreetEasy::NeighborhoodData`, `StreetEasy::Geo`, and others.

THOUGHTS:
* extract `StreetEasy::Property` into `StreetEasy::Property::Rental` and `StreetEasy::Property::Sale`?
* return objects instead of hashes?
* add a `.first` method? Other methods?
* don't implement method chaining?

1. Fork it ( https://github.com/cblokker/street_easy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
