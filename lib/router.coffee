Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

Router.route '/',
  name: 'things',
  data: -> Things.find()

Router.route '/things/:_id',
  name: 'thing',
  data: -> Things.findOne(@params._id)

Router.route '/createThing',
  name: 'createThing'

requireLogin = ->
  if (! Meteor.user())
    if (Meteor.loggingIn())
      this.render(this.loadingTemplate)
    else
      this.render('accessDenied')
  else
    this.next()

Router.onBeforeAction 'dataNotFound',
  only: 'thing'

Router.onBeforeAction requireLogin,
  only: 'createThing'
