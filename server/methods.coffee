Meteor.methods
  thingInsert: (thingAttributes) ->
    # `check` is provided by the `audit-argument-checks` package, which
    # is recommended in Discover Meteor. Mixed feelings.
    check(Meteor.userId(), String)
    check(thingAttributes, {
      name: String
    })
    user = Meteor.user()
    thing = _.extend(thingAttributes, {
      userId:    user._id,
      author:    user.username,
      createdAt: new Date()
    })

    Things.insert(thing)

  descriptionInsert: (descriptionAttributes) ->
    check(Meteor.userId(), String)
    check(descriptionAttributes, {
      thingId: String
      name: String
    })
    user = Meteor.user()
    description = _.extend(descriptionAttributes, {
      userId:    user._id,
      author:    user.username,
      createdAt: new Date()
    })

    Descriptions.insert(description)
