# App.electNotification = App.cable.subscriptions.create "ElectChannel",
#   connected: ->
#     # Called once the subscription has been successfully completed
#
#   vote: (data)->
#     # tell action-cable rails to execute something
#     # TODO: test if we're admin
#     @perform 'vote', data
