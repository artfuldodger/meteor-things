Meteor.subscribe('things')

Template.things.helpers
  things: ->
    Things.find({}, { sort: { createdAt: -1 }})
