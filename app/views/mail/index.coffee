Base = require '../base'

module.exports = class MailIndex extends Base

  contentBlock: ->
    @form {class:'form-horizontal', action:'/mail/send', method: 'post'}, ->
      @fieldset ->
        @legend 'From'
        @controlGroup ->
          @controlLabel 'from-host', 'Host'
          @controls ->
            @input type:'text', id:'from-host', name:'from[host]', value:'smpt.gmail.com'
        @controlGroup ->
          @controlLabel 'from-user', 'Username'
          @controls ->
            @input type:'text', id:'from-user', name:'from[user]'
        @controlGroup ->
          @controlLabel 'from-password', 'Password'
          @controls ->
            @input type:'password', id:'from-password', name:'from[password]'
        @controlGroup ->
          @controlLabel 'from-address', 'Address'
          @controls ->
            @input type:'email', id:'from-address', name:'from[address]', placeholder:'you@place.com'
        @controlGroup ->
          @controlLabel 'from-ssl', 'SSL'
          @controls ->
            @input type:'checkbox', id:'from-ssl', name:'from[ssl]', checked:yes
      @fieldset ->
        @legend 'E-Mail'
        @controlGroup ->
          @controlLabel 'to', 'To'
          @controls ->
            @input type:'text', id:'to', name:'to', placeholder:'someone@someplace.com.au'
        @controlGroup ->
          @controlLabel 'subject', 'Subject'
          @controls ->
            @input type:'text', id:'subject', name:'subject', value:'Newsletter Test'
        @controlGroup ->
          @controlLabel 'body-html', 'HTML'
          @controls ->
            @textarea id:'body-html', name:'body[html]'
        @controlGroup ->
          @controlLabel 'body-text', 'Text'
          @controls ->
            @textarea id:'body-text', name:'body[text]'
        @controlGroup ->
          @controls ->
            @input class:'btn', type:'submit', value:'Send'

  controlGroup: (content)->
    @div {class:'control-group'}, content

  controlLabel: (labelling, content)->
    @label {class:'control-label', for:labelling}, content

  controls: (content)->
    @div {class:'controls'}, content

