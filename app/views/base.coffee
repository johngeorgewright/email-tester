View = require('coffee-views').Base

module.exports = class Base extends View

  render: (options)->
    @doctype 5
    @html {lang:'en'}, ->
      @title 'E-Mail Tester'
      @meta encoding:'utf8'
      @link rel:'stylesheet', href:'vendor/bootstrap/css/bootstrap.min.css'
    @body ->
      @div {class:'container'}, ->
        if options.flash
          if options.flash.error.length > 0
            @alert 'error', options.flash.error
          if options.flash.warning.length > 0
            @alert 'warning', options.flash.warning
          if options.flash.info.length > 0
            @alert 'info', options.flash.info
        @h1 'E-Mail Tester'
        @contentBlock()

  contentBlock: ->

  alert: (type, message)->
    @div {class:"alert alert-#{type}"}, ->
      @strong type.substr(0, 1).toUpperCase() + type.substring(1)
      @unlit " #{message}"

