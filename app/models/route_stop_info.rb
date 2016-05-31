class RouteStopInfo < ApplicationRecord
  belongs_to :profile
  belongs_to :transport_route_info
end
