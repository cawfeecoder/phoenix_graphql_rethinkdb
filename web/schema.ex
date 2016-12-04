defmodule RethinkdbGraphqlRethinkdb.Schema do
  use Absinthe.Schema
  import_types RethinkdbGraphqlRethinkdb.Types.User
  import_types RethinkdbGraphqlRethinkdb.Types.Post
  import_types RethinkdbGraphqlRethinkdb.Types.Comment
  import_types RethinkdbGraphqlRethinkdb.Types.Like
  import_types RethinkdbGraphqlRethinkdb.Types.Video

  query do

    #Post Related Queries

    @desc "Find All Posts"
    field :find_all_posts, list_of(:post) do
      resolve &RethinkdbGraphqlRethinkdb.PostResolver.all/2
    end

    @desc "Find Post By ID"
    field :find_post_by_id, type: :post do
      arg :id, non_null(:id)
        resolve &RethinkdbGraphqlRethinkdb.PostResolver.findByID/2
    end

    @desc "Find Posts By User ID"
    field :find_posts_by_user_id, list_of(:post) do
      arg :user_id, non_null(:string)
        resolve &RethinkdbGraphqlRethinkdb.PostResolver.findByUserID/2
    end

    @desc "Find Posts By Email"
    field :find_posts_by_email, list_of(:post) do
      arg :email, non_null(:string)
        resolve &RethinkdbGraphqlRethinkdb.PostResolver.findByEmail/2
    end

    @desc "Find Posts By Username"
    field :find_posts_by_username, list_of(:post) do
      arg :username, non_null(:string)
        resolve &RethinkdbGraphqlRethinkdb.PostResolver.findByUsername/2
    end

    #User Related Queries

    @desc "Find All Users"
    field :find_all_users, list_of(:user) do
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.all/2
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

    @desc "Find User By Username"
    field :find_user_by_username, type: :user do
      arg :username, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.findByUsername/2
    end

    @desc "Find Users By Role"
    field :find_users_by_role, list_of(:user) do
      arg :role, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.findByRole/2
    end

    #Video Related Queries

    @desc "Find All Videos"
    field :find_all_videos, list_of(:video) do
      resolve &RethinkdbGraphqlRethinkdb.VideoResolver.all/2
    end

    @desc "Find Video By ID"
    field :find_video_by_id, type: :video do
      arg :id, non_null(:id)
      resolve &RethinkdbGraphqlRethinkdb.VideoResolver.findByID/2
    end

    @desc "Find Videos By User ID"
    field :find_videos_by_user_id, list_of(:video) do
      arg :user_id, non_null(:string)
        resolve &RethinkdbGraphqlRethinkdb.VideoResolver.findByUserID/2
    end

    @desc "Find Videos By Email"
    field :find_videos_by_email, list_of(:video) do
      arg :email, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.VideoResolver.findByEmail/2
    end

    @desc "Find Videos By Username"
    field :find_videos_by_username, list_of(:video) do
      arg :username, non_null(:string)
        resolve &RethinkdbGraphqlRethinkdb.VideoResolver.findByUsername/2
    end

    #Comment Related Queries

    @desc "Find All Comments"
    field :find_all_comments, list_of(:comment) do
      resolve &RethinkdbGraphqlRethinkdb.CommentResolver.all/2
    end

    @desc "Find Comment By ID"
    field :find_comment_by_id, type: :comment do
      arg :id, non_null(:id)
      resolve &RethinkdbGraphqlRethinkdb.CommentResolver.findByID/2
    end

    @desc "Find Comments By User ID"
    field :find_comments_by_user_id, list_of(:comment) do
      arg :user_id, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.CommentResolver.findByUserID/2
    end

    @desc "Find Comments By Email"
    field :find_comments_by_email, list_of(:comment) do
      arg :email, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.CommentResolver.findByEmail/2
    end

    @desc "Find Comments By Username"
    field :find_comments_by_username, list_of(:comment) do
      arg :username, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.CommentResolver.findByUsername/2
    end

    @desc "Find Comments By Video ID"
    field :find_comments_by_video_id, list_of(:comment) do
      arg :video_id, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.CommentResolver.findByVideoID/2
    end

    @desc "Find Comments By Post ID"
    field :find_comments_by_post_id, list_of(:comment) do
      arg :post_id, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.CommentResolver.findByPostID/2
    end

    #Like Related Queries

    @desc "Find All Likes"
    field :find_all_likes, list_of(:like) do
      resolve &RethinkdbGraphqlRethinkdb.LikeResolver.all/2
    end

    @desc "Find Like By ID"
    field :find_like_by_id, type: :like do
      arg :id, non_null(:id)
      resolve &RethinkdbGraphqlRethinkdb.LikeResolver.findByID/2
    end

    @desc "Find Likes By User ID"
    field :find_likes_by_user_id, list_of(:like) do
      arg :user_id, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.LikeResolver.findByUserID/2
    end

    @desc "Find Likes By Email"
    field :find_likes_by_email, list_of(:like) do
      arg :email, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.LikeResolver.findByEmail/2
    end

    @desc "Find Likes By Username"
    field :find_likes_by_username, list_of(:like) do
      arg :username, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.LikeResolver.findByUsername/2
    end

    @desc "Find Likes By Video ID"
    field :find_likes_by_video_id, list_of(:like) do
      arg :video_id, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.LikeResolver.findByVideoID/2
    end

    @desc "Find Likes By Post ID"
    field :find_likes_by_post_id, list_of(:like) do
      arg :post_id, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.LikeResolver.findByPostID/2
    end

    @desc "Find Likes By Comment ID"
    field :find_likes_by_comment_id, list_of(:like) do
      arg :comment_id, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.LikeResolver.findByCommentID/2
    end

  end

  mutation do

    #User Related Mutations

    @desc "Create a new User"
    field :create_user, type: :user do
      arg :first_name, non_null(:string)
      arg :last_name, non_null(:string)
      arg :username, non_null(:string)
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.create/2
    end

    @desc "Update a single User"
    field :update_user, type: :user do
      arg :id, non_null(:id)
      arg :first_name, :string
      arg :last_name, :string
      arg :username, :string
      arg :email, :string
      arg :password, :string
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.update_single/2
    end

    @desc "Suspend a single User"
    field :suspend_user, type: :user do
      arg :id, non_null(:id)
      arg :suspend_time, non_null(:integer)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.suspend_single/2
    end

    @desc "Unsuspend a single User"
    field :unsuspend_user, type: :user do
      arg :id, non_null(:id)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.unsuspend_single/2
    end

    @desc "Delete a single User"
    field :delete_user, type: :user do
      arg :id, non_null(:id)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.delete/2
    end
  end
end
