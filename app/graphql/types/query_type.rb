module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :post, PostType, 'Find a post by ID' do
      argument :id, ID
    end

    field :posts, [PostType]

    def post(id:)
      Post.find(id)
    end

    def posts
      Post.ordered
    end
  end
end
