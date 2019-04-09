$(document).on('turbolinks:load', function(){
    $("a.load_reviews").on("click", function(e){
        e.preventDefault();
        $.ajax({
            method: "GET",
            url: this.href,
            dataType: 'json'
        }).done(function(data){
                data.forEach(function(review){
                    $("div.reviews").append("<ul>" + "<li>" + review.user_username + " " + "said: " + review.content + "</li>" + "</ul>")
                });
        })                   
    })
})

function Review (content, username, date){
    this.content = content;
    this.username = username;
    this.date = date;
    console.log(this)
  }

Review.prototype.showReview = function(){
    console.log (`${this.content} by ${this.username}`)
  }

