Meteor.subscribe('descriptions')

Template.thing.events
  'submit form#new-description': (event) ->
    event.preventDefault()

    description = {
      thingId:   @_id
      name:      $('input[name=name]').val()
    }

    Meteor.call 'descriptionInsert', description, (error, result) ->
      if (error)
        alert(error.reason);
      else
      $('input[name=name]').val('').focus()

  'click .delete-description': (e) ->
    e.preventDefault()

    if confirm("Are you sure you want to delete this?")
      Descriptions.remove(@_id)

Template.thing.helpers
  descriptions: ->
    Descriptions.find({ thingId: @_id }, { sort: { createdAt: -1 } })

  ownPost: ->
    @userId is Meteor.userId()
