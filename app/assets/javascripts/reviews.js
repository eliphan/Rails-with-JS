$(function(){
    $("a.load_reviews").on("click", function(e){
        e.preventDefault();
        $.ajax({
            method: "GET",
            url: this.href,
            dataType: "json"
        }).done(function(data){
            console.log(data)
        });

    })
})

function getReview() {
    $.ajax({
        url: this.href
    })
}

function Review (content, username, date){
    this.content = content;
    this.username = username;
    this.date = date;
    console.log(this)
  }

Review.prototype.showReview = function(){
    console.log `${this.content} by ${this.user_username}`
  }

    // <li>
    //     <%= review.user.try(:username) || review.user.try(:email) %> said:
    //     <%= review.content %><br>
    //     <%= review.created_at %>
        
    //     <% if review.user == current_user || @user.try(:admin) %>
    //         <%= form_for(review, method:"delete")do |f| %>
    //         <%= f.submit "Delete" %>
    //         <% end %>
    //     <% end %>
    // </li>