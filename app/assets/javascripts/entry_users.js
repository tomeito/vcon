let onready = function() {
    $(".profile-thumbnail").on("click", function (e) {
        e.preventDefault();
        console.log("サムネイルクリック");
        let id = $(this).data("candidate");
        console.log(id);
        $(".window." + id).addClass("visible");
        console.log(".window " + id);
        $(".overlay." + id).fadeIn().css("display", "flex");
    });
    $(".window").on("click", function (e) {
        e.stopPropagation();
    });
    $(".overlay").on("click", function (e) {
        e.preventDefault();

        $(this).fadeOut();
        $(".window").removeClass("visible");
    });
};

$(document).ready(onready);
$(document).on("page:load", onready);