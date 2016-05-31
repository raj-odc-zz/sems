class StudentTransport < ApplicationRecord
  belongs_to :profile
  belongs_to :route_stop_info
end
