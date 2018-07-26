class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
# Callbacks are methods that get called at certain moments of an object's life cycle.
# With callbacks it is possible to write code that will run whenever an Active Record object
# is created, saved, updated, deleted, validated, or loaded from the database.
  after_create_commit { MessageBroadcastJob.perform_later(self) }
  # MessageBroadcastJob.perform_later(self) puts the job into the queue after the creation of the message. Therefore,
  # in the job file you can access parameters via the object itself, in this case the message.

# timestamp relies on strftime to present message’s creation date in a user-friendly format
  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
