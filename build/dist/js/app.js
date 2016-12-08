(function() {
  var highlightSelection, traverseDown, traverseUp;

  $(function() {
    highlightSelection();
  });

  traverseUp = function() {
    $("#search-results a.selected").removeClass('selected').prev().addClass('selected');
  };

  traverseDown = function() {
    $("#search-results a.selected").removeClass('selected').next().addClass('selected');
  };

  highlightSelection = function() {
    $('#search-posts').off('keydown');
    $('#search-posts').on('keydown', function(e) {
      var endOfList, topOfList;
      if (e.which === 40) {
        if (e.preventDefault) {
          e.preventDefault();
        } else {
          e.returnValue = false;
        }
        endOfList = $("#search-results a.selected").index() + 1 === $("#search-results").children().length;
        if (!endOfList) {
          return traverseDown();
        }
      } else if (e.which === 38) {
        if (e.preventDefault) {
          e.preventDefault();
        } else {
          e.returnValue = false;
        }
        topOfList = $("#search-results a.selected").index() === 0;
        if (!topOfList) {
          return traverseUp();
        }
      } else if (e.which === 13) {
        if (e.preventDefault) {
          e.preventDefault();
        } else {
          e.returnValue = false;
        }
        return window.open($('#search-results a.selected').attr('href'), '_self');
      }
    });
    return false;
  };

}).call(this);

(function() {
  $(function() {
    return $('#mc_embed_signup').find('form').ajaxChimp();
  });

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
        var email, form, label, settings, url;
        form = $(elem);
        email = form.find('input[type=email]');
        label = $('.subscribe').find('.info');
        settings = $.extend({
          'url': form.attr('action'),
          'language': 'en'
        }, options);
        url = settings.url.replace('/post?', '/post-json?').concat('&c=?');
        form.attr('novalidate', 'true');
        email.attr('name', 'EMAIL');
        form.submit(function() {
          var data, dataArray, msg, submitMsg, successCallback;
          msg = void 0;
          data = {};
          dataArray = form.serializeArray();
          successCallback = function(resp) {
            var i;
            var e, index, parts;
            if (resp.result === 'success') {
              msg = 'We have sent you a confirmation email';
              label.removeClass('error').addClass('valid');
              email.removeClass('error').addClass('valid');
            } else {
              email.removeClass('valid').addClass('error');
              label.removeClass('valid').addClass('error');
              index = -1;
              try {
                parts = resp.msg.split(' - ', 2);
                if (parts[1] === void 0) {
                  msg = resp.msg;
                } else {
                  i = parseInt(parts[0], 10);
                  if (i.toString() === parts[0]) {
                    index = parts[0];
                    msg = parts[1];
                  } else {
                    index = -1;
                    msg = resp.msg;
                  }
                }
              } catch (_error) {
                e = _error;
                index = -1;
                msg = resp.msg;
              }
            }
            if (settings.language !== 'en' && $.ajaxChimp.responses[msg] !== void 0 && $.ajaxChimp.translations && $.ajaxChimp.translations[settings.language] && $.ajaxChimp.translations[settings.language][$.ajaxChimp.responses[msg]]) {
              msg = $.ajaxChimp.translations[settings.language][$.ajaxChimp.responses[msg]];
            }
            label.html(msg);
            label.show(2000);
            if (settings.callback) {
              settings.callback(resp);
            }
          };
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
          submitMsg = 'Submitting...';
          if (settings.language !== 'en' && $.ajaxChimp.translations && $.ajaxChimp.translations[settings.language] && $.ajaxChimp.translations[settings.language]['submit']) {
            submitMsg = $.ajaxChimp.translations[settings.language]['submit'];
          }
          label.html(submitMsg).show(2000);
          return false;
        });
      });
      return this;
    };
  })(jQuery);

}).call(this);

(function() {
  var revealNavigation, setNavigation;

  $(function() {
    setNavigation();
    return revealNavigation();
  });

  $(window).resize(function() {
    return revealNavigation();
  });

  setNavigation = function() {
    var baseUrl, path;
    baseUrl = "/website";
    path = window.location.pathname;
    if (window.location.host.indexOf("github.io") > -1) {
      path = path.replace(baseUrl, "");
    }
    path = path.replace(/\/$/, '');
    $('#main-nav>a').each(function() {
      var href;
      href = $(this).attr('href');
      if (path.substring(0, href.length) === href) {
        if (href.length > 1) {
          $(this).addClass('active');
        }
      } else if (href.length === 1) {
        $(this).addClass('active');
      }
    });
  };

  revealNavigation = function() {
    var height, width;
    width = $(window).width();
    height = $(window).height();
    $('#page-content-wrapper').scroll(function() {
      var heightHidden;
      if ($('.landing').length > 0) {
        heightHidden = $('.landing').height() + $('.about').height() + $('.subscribe').height() + $('.contact').outerHeight();
      } else {
        heightHidden = 400;
      }
      if ($('#page-content-wrapper').scrollTop() > heightHidden && width > height && height <= 1000) {
        $('.navbar').css('display', 'none');
        $('#page-content-wrapper').css({
          'margin-top': '0',
          'height': '100%'
        });
        $('.menu-toggle').css({
          'margin': '1rem 0 0 1rem',
          'background': 'rgba(75,75,75,.35)',
          'box-shadow': '0 1px 1px 0 rgba(0,0,0,.45)'
        });
      } else {
        $('.navbar').css('display', '');
        $('#page-content-wrapper').css({
          'margin-top': '',
          'height': ''
        });
        $('.menu-toggle').css({
          'margin': '',
          'background': '',
          'box-shadow': ''
        });
      }
    });
  };

}).call(this);

(function() {
  var revealScrollToTop;

  $(function() {
    return revealScrollToTop();
  });

  revealScrollToTop = function() {
    $('#page-content-wrapper').scroll(function() {
      if ($('#page-content-wrapper').scrollTop() > 300) {
        $('.scrollToTop').css('display', 'block');
      } else {
        $('.scrollToTop').css('display', '');
      }
    });
    $('.scrollToTop').click(function() {
      $('#page-content-wrapper').animate({
        scrollTop: 0
      }, 800);
      return false;
    });
  };

}).call(this);

(function() {
  $(function() {
    var baseUrl, isSelected, u;
    baseUrl = '/website';
    u = window.location.host.indexOf('github.io');
    if (u === -1) {
      baseUrl = '';
    }
    SimpleJekyllSearch({
      searchInput: document.getElementById('search-posts'),
      resultsContainer: document.getElementById('search-results'),
      json: baseUrl + '/search.json',
      searchResultTemplate: '<a href="{url}"><li><div class="primary">{title}</div><div class="secondary">{date}</div></li></a>',
      noResultsText: '<li class="no-results">No results found</li>',
      limit: 15,
      fuzzy: false,
      templateMiddleware: function() {
        var result;
        result = document.querySelector('#search-results>a');
        if ((result != null) && result.classList.length === 0) {
          return result.classList.add('selected');
        }
      }
    });
    if ($('#search-results').children('.no-results').length > 0) {
      $('#search-results').css('max-height', 'inherit');
    }
    if ($('#search-posts').val().length > 0) {
      isSelected = true;
    } else {
      isSelected = false;
    }
    $('#search-results').hover((function() {
      isSelected = true;
    }), function() {
      isSelected = false;
    });
    $('#search-posts').on('keyup', function() {
      if ($('#search-posts').val().length === 0) {
        $('#search-results').css('display', 'none');
      } else {
        $('#search-results').css('display', '');
      }
      return false;
    });
    $('.search-submit').hover((function() {
      isSelected = true;
      $('.search-submit').click(function() {
        var selected, url;
        selected = document.querySelector('#search-results a.selected');
        if (selected) {
          url = selected.getAttribute('href');
        }
        window.open(url, '_self');
      });
    }), function() {
      isSelected = false;
    });
    $('#search-posts').focusout(function() {
      if (!isSelected && $('#search-posts').val().length > 0) {
        $('#search-results').css('display', 'none');
      }
    });
    $('#search-posts').focusin(function() {
      if ($('#search-results').css('display') === 'none' && $('#search-posts').val().length > 0) {
        $('#search-results').css('display', '');
      }
    });
  });

}).call(this);

(function() {
  var moveClouds;

  $(function() {
    return moveClouds();
  });

  moveClouds = function(e, s, d) {
    var wait;
    $(e).css('right', '-20%');
    wait = window.setTimeout((function() {
      $(e).animate({
        right: '120%'
      }, s, 'linear', function() {
        moveClouds(e, s, d);
      });
    }), d);
  };

}).call(this);

(function() {
  $(function() {
    var menu, menulink;
    $('#scroll-indicator').addClass('animated bounce').removeClass('hidden');
    menu = $('.sidebar');
    menulink = $('.menu-toggle');
    $(menulink).click(function() {
      $(menulink).toggleClass('active');
      $(menu).toggleClass('active');
      $('#page-content-wrapper').toggleClass('active');
      return false;
    });
  });

}).call(this);
