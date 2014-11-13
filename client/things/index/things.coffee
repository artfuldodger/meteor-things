Meteor.subscribe('things')

Template.things.helpers
  things: ->
    Things.find()
