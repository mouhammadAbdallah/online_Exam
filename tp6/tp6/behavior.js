document.addEventListener("DOMContentLoaded", function (event) {
    var thumbnailElement1 = document.getElementById("smart_thumbnail1");
    var thumbnailElement2 = document.getElementById("smart_thumbnail2");
    var thumbnailElement3 = document.getElementById("smart_thumbnail3");
    var thumbnailElement4 = document.getElementById("smart_thumbnail4");
    var thumbnailElement5 = document.getElementById("smart_thumbnail5");

    thumbnailElement1.addEventListener("click", function () {
        if (thumbnailElement1.className == "") {
            thumbnailElement1.className = "small";
        }
        else thumbnailElement1.className = "";

    });
    thumbnailElement2.addEventListener("click", function () {
        if (thumbnailElement2.className == "") {
            thumbnailElement2.className = "small";
        }
        else thumbnailElement2.className = "";

    });
    thumbnailElement3.addEventListener("click", function () {
        if (thumbnailElement3.className == "") {
            thumbnailElement3.className = "small";
        }
        else thumbnailElement3.className = "";

    });
    thumbnailElement4.addEventListener("click", function () {
        if (thumbnailElement4.className == "") {
            thumbnailElement4.className = "small";
        }
        else thumbnailElement4.className = "";

    });
    thumbnailElement5.addEventListener("click", function () {
        if (thumbnailElement5.className == "") {
            thumbnailElement5.className = "small";
        }
        else thumbnailElement5.className = "";

    });

});
