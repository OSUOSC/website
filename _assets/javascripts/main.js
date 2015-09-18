// ANIMATE.CSS
//-------------------------------------
jQuery(document).ready( function(){
  $('#heading').addClass('animated fadeIn').removeClass('hidden');
  $('.landing>#button').addClass('animated slideInRight').removeClass('hidden');
  $('#heading a#button').addClass('animated slideInUp').removeClass('hidden');
  $('#scroll-indicator').addClass('animated bounce').removeClass('hidden');
});

// MENU TOGGLE ICON
//-------------------------------------
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

// CURRENT PAGE INDICATOR
//-------------------------------------
$(function() {
    setNavigation();
});

function setNavigation() {
    var path = window.location.pathname;
    path = path.replace(/\/$/, "");

    $('#main-nav>a').each(function() {
        var href = $(this).attr('href');

        if (path.substring(0, href.length) === href) {
            if (href.length > 1) {
                $(this).addClass('active');
            }
        } else if (href.length == 1) {
            $(this).addClass('active');
        }

    });
}


// CLOUDS
//-------------------------------------
function moveClouds(e, s, d) {
    $(e).css('right', '-20%');
    var wait = window.setTimeout(function() {
        $(e).animate({
            right: '120%'
        }, s, 'linear', function() {
            moveClouds(e, s, d);
        });
    }, d);
}
// if(!Modernizr.cssanimations) {
//     var clouds = [1,2,3,4];
//
//     $.each(clouds, function() {
//         var e = $('.cloud-' + this);
//         moveClouds(e, e.data('speed'), e.data('delay'));
//     });
// }


// MAILCHIMP
//-------------------------------------
(function($) {
    'use strict';

    $.ajaxChimp = {
        responses: {
            'We have sent you a confirmation email': 0,
            'Please enter a valid email': 1,
            'An email address must contain a single @': 2,
            'The domain portion of the email address is invalid (the portion after the @: )': 3,
            'The username portion of the email address is invalid (the portion before the @: )': 4,
            'This email address looks fake or invalid. Please enter a real email address': 5
        },
        translations: {
            'en': null
        },
        init: function(selector, options) {
            $(selector).ajaxChimp(options);
        }
    };

    $.fn.ajaxChimp = function(options) {
        $(this).each(function(i, elem) {
            var form = $(elem);
            var email = form.find('input[type=email]');
            var label = form.find('.info');

            var settings = $.extend({
                'url': form.attr('action'),
                'language': 'en'
            }, options);

            var url = settings.url.replace('/post?', '/post-json?').concat('&c=?');

            form.attr('novalidate', 'true');
            email.attr('name', 'EMAIL');

            form.submit(function() {
                var msg;

                function successCallback(resp) {
                    if (resp.result === 'success') {
                        msg = 'We have sent you a confirmation email';
                        label.removeClass('error').addClass('valid');
                        email.removeClass('error').addClass('valid');
                    } else {
                        email.removeClass('valid').addClass('error');
                        label.removeClass('valid').addClass('error');
                        var index = -1;
                        try {
                            var parts = resp.msg.split(' - ', 2);
                            if (parts[1] === undefined) {
                                msg = resp.msg;
                            } else {
                                var i = parseInt(parts[0], 10);
                                if (i.toString() === parts[0]) {
                                    index = parts[0];
                                    msg = parts[1];
                                } else {
                                    index = -1;
                                    msg = resp.msg;
                                }
                            }
                        } catch (e) {
                            index = -1;
                            msg = resp.msg;
                        }
                    }

                    // Translate and display message
                    if (
                        settings.language !== 'en' && $.ajaxChimp.responses[msg] !== undefined && $.ajaxChimp.translations && $.ajaxChimp.translations[settings.language] && $.ajaxChimp.translations[settings.language][$.ajaxChimp.responses[msg]]
                    ) {
                        msg = $.ajaxChimp.translations[settings.language][$.ajaxChimp.responses[msg]];
                    }
                    label.html(msg);

                    label.show(2000);
                    if (settings.callback) {
                        settings.callback(resp);
                    }
                }

                var data = {};
                var dataArray = form.serializeArray();
                $.each(dataArray, function(index, item) {
                    data[item.name] = item.value;
                });

                $.ajax({
                    url: url,
                    data: data,
                    success: successCallback,
                    dataType: 'jsonp',
                    error: function(resp, text) {
                        console.log('mailchimp ajax submit error: ' + text);
                    }
                });

                // Translate and display submit message
                var submitMsg = 'Submitting...';
                if (
                    settings.language !== 'en' && $.ajaxChimp.translations && $.ajaxChimp.translations[settings.language] && $.ajaxChimp.translations[settings.language]['submit']
                ) {
                    submitMsg = $.ajaxChimp.translations[settings.language]['submit'];
                }
                label.html(submitMsg).show(2000);

                return false;
            });
        });
        return this;
    };
})(jQuery);


// FLAT ICON SHADOWS
//-------------------------------------
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
