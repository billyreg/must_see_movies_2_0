json.extract! review, :id, :movie_id, :rating, :user_id, :comment, :created_at,
              :updated_at
json.url review_url(review, format: :json)
