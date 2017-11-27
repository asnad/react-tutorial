@Messages = React.createClass
  getInitialState: ->
    messages: @props.data
  getDefaultProps: ->
    messages: []
  addMessage: (message)->
    messages = @state.messages.slice()
    messages.unshift message
    console.log messages
    @setState messages: messages
  render: ->
    React.DOM.div
      className: 'messages'
      React.DOM.h1
        className: "messages"
        "Messages"
      React.createElement MessageForm, handleNewMessage: @addMessage
      React.DOM.table
        className: "table table-bordered"
        React.DOM.thead null,
          React.DOM.th null, "Text"
          React.DOM.th null, "Is Important"
          React.DOM.th null, "DateTime"
        React.DOM.tbody null,
          for message in @state.messages
            React.createElement Message, key: message.id, message: message
