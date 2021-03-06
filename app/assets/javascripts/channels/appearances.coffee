jQuery(document).on 'ready page:load', ->
  App.personal_note = App.cable.subscriptions.create {
    channel: "AppearancesChannel"
  },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    user = $(".user-#{data['user_id']}")
    user.toggleClass 'online', data['online']
