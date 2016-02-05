# mailchimp

$(document).ready ->
  $('#mc_embed_signup').find('form').ajaxChimp()

(($) ->
  'use strict'
  $.ajaxChimp =
    responses:
      'We have sent you a confirmation email': 0
      'Please enter a valid email': 1
      'An email address must contain a single @': 2
      'The domain portion of the email address is invalid (the portion after the @: )': 3
      'The username portion of the email address is invalid (the portion before the @: )': 4
      'This email address looks fake or invalid. Please enter a real email address': 5
    translations: 'en': null
    init: (selector, options) ->
      $(selector).ajaxChimp options
      return

  $.fn.ajaxChimp = (options) ->
    $(this).each (i, elem) ->
      form = $(elem)
      email = form.find('input[type=email]')
      label = $('.subscribe').find('.info')
      settings = $.extend({
        'url': form.attr('action')
        'language': 'en'
      }, options)
      url = settings.url.replace('/post?', '/post-json?').concat('&c=?')
      form.attr 'novalidate', 'true'
      email.attr 'name', 'EMAIL'
      form.submit ->
        msg = undefined
        data = {}
        dataArray = form.serializeArray()

        successCallback = (resp) ->
          `var i`
          if resp.result == 'success'
            msg = 'We have sent you a confirmation email'
            label.removeClass('error').addClass 'valid'
            email.removeClass('error').addClass 'valid'
          else
            email.removeClass('valid').addClass 'error'
            label.removeClass('valid').addClass 'error'
            index = -1
            try
              parts = resp.msg.split(' - ', 2)
              if parts[1] == undefined
                msg = resp.msg
              else
                i = parseInt(parts[0], 10)
                if i.toString() == parts[0]
                  index = parts[0]
                  msg = parts[1]
                else
                  index = -1
                  msg = resp.msg
            catch e
              index = -1
              msg = resp.msg
          # Translate and display message
          if settings.language != 'en' and $.ajaxChimp.responses[msg] != undefined and $.ajaxChimp.translations and $.ajaxChimp.translations[settings.language] and $.ajaxChimp.translations[settings.language][$.ajaxChimp.responses[msg]]
            msg = $.ajaxChimp.translations[settings.language][$.ajaxChimp.responses[msg]]
          label.html msg
          label.show 2000
          if settings.callback
            settings.callback resp
          return

        $.each dataArray, (index, item) ->
          data[item.name] = item.value
          return
        $.ajax
          url: url
          data: data
          success: successCallback
          dataType: 'jsonp'
          error: (resp, text) ->
            console.log 'mailchimp ajax submit error: ' + text
            return
        # Translate and display submit message
        submitMsg = 'Submitting...'
        if settings.language != 'en' and $.ajaxChimp.translations and $.ajaxChimp.translations[settings.language] and $.ajaxChimp.translations[settings.language]['submit']
          submitMsg = $.ajaxChimp.translations[settings.language]['submit']
        label.html(submitMsg).show 2000
        false
      return
    this

  return
) jQuery
