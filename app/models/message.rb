class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self } # createがコミットされたときのcallback指定
end
