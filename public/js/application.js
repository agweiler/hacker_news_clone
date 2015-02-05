$(document).ready(function() {
});


function upVoteC(comment_id, session_user) {
  console.log("Fuction Start");
  $.ajax({
    type: "post",
    url: '/upvotec',
    dataType: "json",
    data: {"comment_id": comment_id, "user": session_user},
    success: function(msg) {
      alert(msg)
    },
  });
}

function downVoteC(comment_id, session_user) {
  console.log("Fuction Start");
  $.ajax({
    type: "post",
    url: '/downvotec',
    dataType: "json",
    data: {"comment_id": comment_id, "user": session_user},
    success: function(msg) {
      alert(msg)
    },
  });
}

function upVoteP(post_id, session_user) {
  console.log("Fuction Start");
  $.ajax({
    type: "post",
    url: '/upvotep',
    dataType: "json",
    data: {"post_id": post_id, "user": session_user},
    success: function(msg) {
      alert(msg)
    },
  });
}

function downVoteP(post_id, session_user) {
  console.log("Fuction Start");
  $.ajax({
    type: "post",
    url: '/downvotep',
    dataType: "json",
    data: {"post_id": post_id, "user": session_user},
    success: function(msg) {
      alert(msg)
    },
  });
}

// params {}
// params[:post] => {"title": "something"}
// params[:post][:title] => "something"