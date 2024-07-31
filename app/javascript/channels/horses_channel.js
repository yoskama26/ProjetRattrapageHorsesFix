// app/javascript/channels/horses_channel.js
import { createConsumer } from "@rails/actioncable"

const consumer = createConsumer()

consumer.subscriptions.create("HorsesChannel", {
  received(data) {
    document.getElementById("horses").outerHTML = data.turbo_stream
  }
})

