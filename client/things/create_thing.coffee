Template.createThing.events
  'submit form': (event) ->
    event.preventDefault()

    thing = {
      name: $('input[name=name]').val()
    }

    thing._id = Things.insert(thing)

    Router.go('thing', thing)
