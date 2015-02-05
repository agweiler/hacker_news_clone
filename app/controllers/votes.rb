post "/upvotec" do
  p params
  CommentVote.create(user_id: params[:user], value: 1, comment_id: params[:comment_id])
  "Your comment upvote has been counted!".to_json
end

post "/downvotec" do
  p params
  CommentVote.create(user_id: params[:user], value: -1, comment_id: params[:comment_id])
  "Your comment downvote has been counted".to_json
end

post "/upvotep" do
  p params
  PostVote.create(user_id: params[:user], value: 1, post_id: params[:post_id])
  "Your post upvote has been counted".to_json
end

post "/downvotep" do
  p params
  PostVote.create(user_id: params[:user], value: -1, post_id: params[:post_id])
  "Your post downvote has been counted".to_json
end