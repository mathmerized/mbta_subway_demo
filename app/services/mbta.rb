module Mbta
    class Search
        def self.get_subway_lines
            Faraday.get 'https://api-v3.mbta.com/routes?filter[type]=0,1,2&fields[route]=id,long_name'
        end

        def self.get_stops(route_id)
            Faraday.get 'https://api-v3.mbta.com/stops?filter[route]=' + route_id
        end
    end
end