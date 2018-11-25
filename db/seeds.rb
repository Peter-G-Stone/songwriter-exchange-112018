peter = User.create(username: "peter", email: "pmail", password: "peterpass")

annie = User.create(username: "annie", email: "amail", password: "anniepass")

sophie = User.create(username: "sophie", email: "smail", password: "sophiepass")



t = peter.snippets.build(title: "peter's first song")
t.save

t = annie.snippets.build(title: "annie's first song")
t.save


t = sophie.snippets.build(title: "sophie's first song")
t.save

t = peter.snippets.build(title: "leaves and rivers and stuff song")
t.save


t = annie.snippets.build(title: "unicorn song")
t.save

t = sophie.snippets.build(title: "song about biking in place")
t.save

t = peter.snippets.build(title: "power to the people")
t.save

t = annie.snippets.build(title: "song in a madrigal style about esoteric legendary character")
t.save

t = sophie.snippets.build(title: "running really really far is fun song")
t.save
