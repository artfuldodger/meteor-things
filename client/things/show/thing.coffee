Meteor.subscribe('descriptions')

Template.thing.events
  'submit form#new-description': (event) ->
    event.preventDefault()

    description = {
      thingId:   @_id
      name:      $('input[name=name]').val()
      createdAt: new Date()
    }

    Descriptions.insert(description)
    $('input[name=name]').val('')

Template.thing.helpers
  descriptions: ->
    Descriptions.find({ thingId: @_id }, { sort: { createdAt: -1 } })
