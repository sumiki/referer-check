class EmailHistory < ApplicationRecord
  
  enum event: {
    sent: 0,
    processed: 1,
    deferred: 2,
    delivered: 3,
    open: 4,
    click: 5,
    bounce: 6,
    dropped: 7,
    spamreport: 8,
    unsubscribe: 9,
    group_unsubscribe: 10,
    group_resubscribe: 11,
  }
  
  after_create_commit { MessageBroadcastJob.perform_later self }
  
end
