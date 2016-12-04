alias RethinkdbGraphqlRethinkdb.User
alias RethinkdbGraphqlRethinkdb.Post
alias RethinkdbGraphqlRethinkdb.Comment
alias RethinkdbGraphqlRethinkdb.Like
alias RethinkdbGraphqlRethinkdb.Video
alias RethinkdbGraphqlRethinkdb.Repo
import Ecto.Query

Repo.insert!(%User{first_name: "Ryan", join_date: "1-2-16", last_name: "Swapp", username: "rswapp", email: "ryan@ryan.com", password: "abc123efg", role: "user"})
Repo.insert!(%User{first_name: "Rosie", join_date: "1-2-16", last_name: "O'Donnell", username: "RosieD", email: "rosie@mydog.com", password: "456hij789", role: "admin"})

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

for _ <- 1..2 do
  Repo.insert!(%Video{
    title: Faker.Lorem.sentence,
    url: "http://www,youtube.com/",
    description: Faker.Lorem.paragraph,
    created_at: "1-2-16",
    view_count: :rand.uniform(1000),
    published: false,
    user_id: [user1.id, user2.id] |> Enum.take_random(1) |> hd
    })
end

videos = Repo.all(from v in Video, select: v.id)

for _ <- 1..50 do
  Repo.insert!(%Comment{
    created_at: "1-2-16",
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    post_id: posts |> Enum.take_random(1) |> hd,
    user_id: [user1.id, user2.id] |> Enum.take_random(1) |> hd,
    video_id: videos |> Enum.take_random(1) |> hd
    })
end

comments = Repo.all(from c in Comment, select: c.id)

for _ <- 1..100 do
  Repo.insert!(%Like{
    created_at: "1-2-16",
    value: [-1, 1] |> Enum.take_random(1) |> hd,
    post_id: posts |> Enum.take_random(1) |> hd,
    user_id: [user1.id, user2.id] |> Enum.take_random(1) |> hd,
    video_id: videos |> Enum.take_random(1) |> hd,
    comment_id: comments |> Enum.take_random(1) |> hd
    })
end
