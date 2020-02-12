justin = User.create(name: "Justin", email: "Justin@gmail.com", password: "password")
milly = User.create(name: "Milly", email: "Milly@gmail.com", password: "password")

Game.create(name: "Halo2", release_date: 2002, console: "Xbox", details: "First Person Shooter",user: justin)

justin.games.create(name: "Call Of Duty", release_date: 2010, console: "Playstation", details: "Multiplayer Shooter")

justins_game = justin.games.build(name: "Gears Of War", release_date: 2009, console: "Xbox", details: "Locust Hordes")
justins_game.save