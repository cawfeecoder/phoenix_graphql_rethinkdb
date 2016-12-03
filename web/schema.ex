defmodule RethinkdbGraphqlRethinkdb.Schema do
  use Absinthe.Schema
  import_types RethinkdbGraphqlRethinkdb.Types.User
  import_types RethinkdbGraphqlRethinkdb.Types.Post
  import_types RethinkdbGraphqlRethinkdb.Types.Comment
  import_types RethinkdbGraphqlRethinkdb.Types.Like
  import_types RethinkdbGraphqlRethinkdb.Types.Video

  query do
    @desc "Find All Posts"
    field :find_all_posts, list_of(:post) do
      resolve &RethinkdbGraphqlRethinkdb.PostResolver.all/2
    end

    @desc "Find All Users"
    field :find_all_users, list_of(:user) do
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.all/2
    end

    @desc "Find All Videos"
    field :find_all_videos, list_of(:video) do
      resolve &RethinkdbGraphqlRethinkdb.VideoResolver.all/2
    end

    @desc "Find All Comments"
    field :find_all_comments, list_of(:comment) do
      resolve &RethinkdbGraphqlRethinkdb.CommentResolver.all/2
    end

    @desc "Find All Likes"
    field :find_all_likes, list_of(:like) do
      resolve &RethinkdbGraphqlRethinkdb.LikeResolver.all/2
    end

    @desc "Find User By ID"
    field :find_user_by_id, type: :user do
      arg :id, non_null(:id)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.findByID/2
    end

    @desc "Find User By Email"
    field :find_user_by_email, type: :user do
      arg :email, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.findByEmail/2
    end
  end

  mutation do
    field :delete_user, type: :user do
      arg :id, non_null(:id)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.delete/2
    end
    field :create_user, type: :user do
      arg :name, non_null(:string)
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.create/2
    end
  end
end
