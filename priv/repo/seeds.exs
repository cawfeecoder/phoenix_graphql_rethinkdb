alias RethinkdbGraphqlRethinkdb.User
alias RethinkdbGraphqlRethinkdb.Post
alias RethinkdbGraphqlRethinkdb.Repo

Repo.insert!(%User{name: "Ryan", email: "ryan@ryan.com"})
Repo.insert!(%User{name: "Rosie", email: "rosie@mydog.com"})

user1 = Repo.get_by(User, email: "ryan@ryan.com")
user2 = Repo.get_by(User, email: "rosie@mydog.com")

for _ <- 1..10 do
  Repo.insert!(%Post{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [user1.id, user2.id] |> Enum.take_random(1) |> hd
    })
end
