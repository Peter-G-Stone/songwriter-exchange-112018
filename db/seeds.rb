peter = User.create(username: "peter", email: "pmail", password: "peterpass")

annie = User.create(username: "annie", email: "amail", password: "anniepass")

sophie = User.create(username: "sophie", email: "smail", password: "sophiepass")



t = peter.snippets.build(content: "peter's first song")
t.save

t = annie.snippets.build(content: "annie's first song")
t.save


t = sophie.snippets.build(content: "sophie's first song")
t.save

t = peter.snippets.build(content: "leaves and rivers and stuff song")
t.save


t = annie.snippets.build(content: "unicorn song")
t.save

t = sophie.snippets.build(content: "song about biking in place")
t.save

t = peter.snippets.build(content: "power to the people")
t.save

t = annie.snippets.build(content: "song in a madrigal style about esoteric legendary character")
t.save

t = sophie.snippets.build(content: "running really really far is fun song")
t.save
