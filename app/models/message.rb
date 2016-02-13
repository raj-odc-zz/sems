class Message < ApplicationRecord
  belongs_to :board
  belongs_to :message_type
end
