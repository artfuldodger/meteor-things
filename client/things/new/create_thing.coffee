Template.createThing.events
  'submit form': (event) ->
    event.preventDefault()

    thing = {
      name: $('input[name=name]').val()
    }

    Meteor.call 'thingInsert', thing, (error, result) ->
      if (error)
        alert(error.reason);
      else
        Router.go('thing', { _id: result })
