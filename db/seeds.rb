peter = User.create(username: "peter", email: "pmail", password: "peterpass")

annie = User.create(username: "annie", email: "amail", password: "anniepass")

sophie = User.create(username: "sophie", email: "smail", password: "sophiepass")



t = peter.snippets.build(title: "peter's first song", brief: "placeholder brief")
t.save

t = annie.snippets.build(title: "annie's first song", brief: "placeholder brief")
t.save


t = sophie.snippets.build(title: "sophie's first song", brief: "placeholder brief")
t.save

t = peter.snippets.build(title: "leaves and rivers and stuff song", brief: "placeholder brief")
t.save


t = annie.snippets.build(title: "unicorn song", brief: "placeholder brief")
t.save

t = sophie.snippets.build(title: "song about biking in place", brief: "placeholder brief")
t.save

t = peter.snippets.build(title: "power to the people", chart: "sheet-blanket.jpg", brief: "placeholder brief")
t.save

t = annie.snippets.build(title: "song in a madrigal style about esoteric legendary character", brief: "placeholder brief")
t.save

t = sophie.snippets.build(title: "running far song", brief: "this song is gonna be about the joys of running marathons", chart: "running.jpg", audio: "another-fake-audio-filepath", lyrics: "feet on the payment, new york hot-trash smell in your nose, knees grinding away to dust, pop songs in the bluetooth earbuds")
t.save


t = annie.snippets.build(title: "oregon", brief: "just a little ditty about the beautiful oregon countryside", chart: "oregon.jpg", audio: "fake-audio-filepath", lyrics: "Big pretty trees, nice mountains, good people, oregon is nice")