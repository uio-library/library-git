// Make all tables striped by default.
$("table").addClass("table table-striped");


// Handle foldable challenges and solutions (on click and at start).
<<<<<<< HEAD
$(".challenge,.solution").click(function(event) {
=======
$(".challenge,.discussion,.solution").click(function(event) {
>>>>>>> 7f8e13d704e49b625b25b7b655d4c21db70c7ccf
    var trigger = $(event.target).has(".fold-unfold").size() > 0
               || $(event.target).filter(".fold-unfold").size() > 0;
    if (trigger) {
        $(">*:not(h2)", this).toggle(400);
        $(">h2>span.fold-unfold", this).toggleClass("glyphicon-collapse-down glyphicon-collapse-up");
        event.stopPropagation();
    }
});
<<<<<<< HEAD
$(".challenge,.solution").each(function() {
=======
$(".challenge,.discussion,.solution").each(function() {
>>>>>>> 7f8e13d704e49b625b25b7b655d4c21db70c7ccf
    $(">*:not(h2)", this).toggle();
    var h2 = $("h2:first", this);
    h2.append("<span class='fold-unfold glyphicon glyphicon-collapse-down'></span>");
});


// Handle searches.
// Relies on document having 'meta' element with name 'search-domain'.
function google_search() {
  var query = document.getElementById("google-search").value;
  var domain = $("meta[name=search-domain]").attr("value");
  window.open("https://www.google.com/search?q=" + query + "+site:" + domain);
}
