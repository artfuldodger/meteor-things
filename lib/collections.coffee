@Things = new Mongo.Collection('things')
@Descriptions = new Mongo.Collection('descriptions')

# check that the userId specified owns the documents
ownsDocument = (userId, doc) ->
  return doc && doc.userId is userId

Descriptions.allow
  update: (userId, post) -> ownsDocument(userId, post)
  remove: (userId, post) -> ownsDocument(userId, post)
