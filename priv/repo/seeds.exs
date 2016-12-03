alias RethinkdbGraphqlRethinkdb.User
alias RethinkdbGraphqlRethinkdb.Post
alias RethinkdbGraphqlRethinkdb.Comment
alias RethinkdbGraphqlRethinkdb.Like
alias RethinkdbGraphqlRethinkdb.Repo
import Ecto.Query

Repo.insert!(%User{first_name: "Ryan", last_name: "Swapp", username: "rswapp", email: "ryan@ryan.com", password: "abc123efg"})
Repo.insert!(%User{first_name: "Rosie", last_name: "O'Donnell", username: "RosieD", email: "rosie@mydog.com", password: "456hij789"})

user1 = Repo.get_by(User, email: "ryan@ryan.com")
user2 = Repo.get_by(User, email: "rosie@mydog.com")

for _ <- 1..2 do
  Repo.insert!(%Post{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    published: false,
    created_at: "1-2-16",
    user_id: [user1.id, user2.id] |> Enum.take_random(1) |> hd
    })
end

posts = Repo.all(from p in Post, select: p.id)

for _ <- 1..50 do
  Repo.insert!(%Comment{
    created_at: "1-2-16",
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    post_id: posts |> Enum.take_random(1) |> hd,
    user_id: [user1.id, user2.id] |> Enum.take_random(1) |> hd
    })
end

for _ <- 1..100 do
  Repo.insert!(%Like{
    created_at: "1-2-16",
    value: 1,
    post_id: posts |> Enum.take_random(1) |> hd,
    user_id: [user1.id, user2.id] |> Enum.take_random(1) |> hd
    })
end
