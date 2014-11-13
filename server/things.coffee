# You can filter what's published or take params in these functions,
# for example, to only publish things created by the current user.

Meteor.publish 'things', ->
  Things.find()

Meteor.publish 'descriptions', ->
  Descriptions.find()
