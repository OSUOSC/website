jQuery(document).ready( function(){

  // $('#brand').addClass('animated zoomInDown').removeClass('hidden');

  $('#heading').addClass('animated fadeIn').removeClass('hidden');

  $('.landing>#button').addClass('animated slideInRight').removeClass('hidden');

  $('#heading a#button').addClass('animated slideInUp').removeClass('hidden');

  // $('#main-nav').addClass('animated slideInLeft').removeClass('hidden');

  $('#scroll-indicator').addClass('animated bounce').removeClass('hidden');
});


$(document).ready(function() {
  $('body').addClass('js');
  var $menu = $('.sidebar'),
    $menulink = $('.menu-toggle');

$menulink.click(function() {
  $menulink.toggleClass('active');
  $menu.toggleClass('active');
  $('#page-content-wrapper').toggleClass('active');
  return false;
});});




// ICON SHADOWS

! function(e) {
    function s(e, t) {
        e = e.replace("#", "");
        r = parseInt(e.substring(0, 2), 16);
        g = parseInt(e.substring(2, 4), 16);
        b = parseInt(e.substring(4, 6), 16);
        result = "rgba(" + r + "," + g + "," + b + "," + t / 100 + ")";
        return result
    }

    function o(e, t) {
        e = String(e).replace(/[^0-9a-f]/gi, "");
        if (e.length < 6) {
            e = e[0] + e[0] + e[1] + e[1] + e[2] + e[2]
        }
        t = t || 0;
        var n = "#",
            r, i;
        for (i = 0; i < 3; i++) {
            r = parseInt(e.substr(i * 2, 2), 16);
            r = Math.round(Math.min(Math.max(0, r + r * t), 255)).toString(16);
            n += ("00" + r).substr(r.length)
        }
        return n
    }
    var t = new Array("#1ABC9C", "#2ecc71", "#3498db", "#9b59b6", "#34495e", "#f1c40f", "#e67e22", "#e74c3c");
    var n = new Array("NE", "SE", "SW", "NW");
    var i = {
        fade: false,
        color: "random",
        boxShadow: false,
        angle: "random"
    };
    e.fn.flatshadow = function(r) {
        var u = e.extend({}, i, r);
        return this.each(function() {
            el = e(this);
            if (u.fade == true) {
                width = Math.round(el.outerWidth() / 3);
                height = Math.round(el.outerHeight() / 3)
            } else {
                width = Math.round(el.outerWidth());
                height = Math.round(el.outerHeight())
            }
            if (u.boxShadow != false) {
                var r = u.boxShadow
            }
            if (u.color != "random" && !el.attr("data-color")) {
                var i = u.color
            } else {
                var i = t[Math.floor(Math.random() * t.length)];
                if (el.attr("data-color")) {
                    var i = el.attr("data-color")
                }
            }
            if (u.angle != "random" && !el.attr("data-angle")) {
                var a = u.angle
            } else {
                var a = n[Math.floor(Math.random() * n.length)];
                if (el.attr("data-angle")) {
                    var a = el.attr("data-angle")
                }
            }
            var f = o(i, -.3);
            var l = "";
            if (u.boxShadow != false) {
                var c = ""
            } else {
                var c = "none"
            }
            switch (a) {
                case "N":
                    for (var h = 1; h <= height; h++) {
                        if (u.boxShadow != false) c += "0px " + h * 2 * -1 + "px 0px " + s(r, 50 - h / height * 100);
                        if (u.fade != false) {
                            var p = s(f, 100 - h / height * 100)
                        } else {
                            var p = f
                        }
                        l += "0px " + h * -1 + "px 0px " + p;
                        if (h != height) {
                            l += ", ";
                            c += ", "
                        }
                    }
                    break;
                case "NE":
                    for (var h = 1; h <= height; h++) {
                        if (u.boxShadow != false) c += h * 2 + "px " + h * 2 * -1 + "px 0px " + s(r, 50 - h / height * 100);
                        if (u.fade != false) {
                            var p = s(f, 100 - h / height * 100)
                        } else {
                            var p = f
                        }
                        l += h + "px " + h * -1 + "px 0px " + p;
                        if (h != height) {
                            l += ", ";
                            c += ", "
                        }
                    }
                    break;
                case "E":
                    for (var h = 1; h <= width; h++) {
                        if (u.boxShadow != false) c += h * 2 + "px " + "0px 0px " + s(r, 50 - h / width * 100);
                        if (u.fade != false) {
                            var p = s(f, 100 - h / height * 100)
                        } else {
                            var p = f
                        }
                        l += h + "px " + "0px 0px " + p;
                        if (h != width) {
                            l += ", ";
                            c += ", "
                        }
                    }
                    break;
                case "SE":
                    for (var h = 0.1; h <= height; h++) {
                        if (u.boxShadow != false) c += h * 2 + "px " + h * 2 + "px 0px " + s(r, 50 - h / height * 100);
                        if (u.fade != false) {
                            var p = s(f, 100 - h / height * 100)
                        } else {
                            var p = f
                        }
                        l += h + "px " + h + "px 0px " + p;
                        if (h != height) {
                            l += ", ";
                            c += ", "
                        }
                    }
                    break;
                case "S":
                    for (var h = 1; h <= height; h++) {
                        if (u.boxShadow != false) c += "0px " + h * 2 + "px 0px " + s(r, 50 - h / height * 100);
                        if (u.fade != false) {
                            var p = s(f, 100 - h / height * 100)
                        } else {
                            var p = f
                        }
                        l += "0px " + h + "px 0px " + p;
                        if (h != height) {
                            l += ", ";
                            c += ", "
                        }
                    }
                    break;
                case "SW":
                    for (var h = 1; h <= height; h++) {
                        if (u.boxShadow != false) c += h * 2 * -1 + "px " + h * 2 + "px 0px " + s(r, 50 - h / height * 100);
                        if (u.fade != false) {
                            var p = s(f, 100 - h / height * 100)
                        } else {
                            var p = f
                        }
                        l += h * -1 + "px " + h + "px 0px " + p;
                        if (h != height) {
                            l += ", ";
                            c += ", "
                        }
                    }
                    break;
                case "W":
                    for (var h = 1; h <= height; h++) {
                        if (u.boxShadow != false) c += h * 2 * -1 + "px " + "0px 0px " + s(r, 50 - h / height * 100);
                        if (u.fade != false) {
                            var p = s(f, 100 - h / height * 100)
                        } else {
                            var p = f
                        }
                        l += h * -1 + "px " + "0px 0px " + p;
                        if (h != height) {
                            l += ", ";
                            c += ", "
                        }
                    }
                    break;
                case "NW":
                    for (var h = 1; h <= height; h++) {
                        if (u.boxShadow != false) c += h * 2 * -1 + "px " + h * 2 * -1 + "px 0px " + s(r, 50 - h / height * 100);
                        if (u.fade != false) {
                            var p = s(f, 100 - h / height * 100)
                        } else {
                            var p = f
                        }
                        l += h * -1 + "px " + h * -1 + "px 0px " + p;
                        if (h != height) {
                            l += ", ";
                            c += ", "
                        }
                    }
                    break
            }
            el.css({
                // background: i,
                "text-shadow": l
            })
        })
    }
}(window.jQuery);
$(document).ready(function() {
    RandHexVal = "#" + ("000000" + (Math.random() * 16777215 << 0).toString(16)).slice(-6);
    $("[class*='flat']").flatshadow({
      color: "#c0392b",
      angle: "SE",
      fade: false,
      boxShadow: "#222"
    });
    $(".flat-blue").flatshadow({
      color: "#34495e",
      angle: "SE",
      fade: false,
      boxShadow: "#333"
    });
    $(".flat-turq").flatshadow({
      color: "#3498db",
      angle: "SE",
      fade: false,
      boxShadow: "#333"
    });
    $(".flat-grey").flatshadow({
      color: "#ccc",
      angle: "SE",
      fade: false,
      boxShadow: "#333"
    });
    $(".flat-pink").flatshadow({
      color: "#8e44ad",
      angle: "SE",
      fade: false,
      boxShadow: "#333"
    });
    $(".flat-orange").flatshadow({
      color: "#e67e22",
      angle: "SE",
      fade: false,
      boxShadow: "#333"
    });
    $(".flat-green").flatshadow({
      color: "#2ecc71",
      angle: "SE",
      fade: false,
      boxShadow: "#333"
    });
    $(".flat-random").flatshadow({
      color: RandHexVal,
      angle: "SE",
      fade: false,
      boxShadow: "#333"
    })

})
