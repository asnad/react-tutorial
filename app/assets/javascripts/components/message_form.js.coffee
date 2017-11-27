@MessageForm = React.createClass
  getInitialState: ->
    text: ''
    important: true
    text_limit: 120
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
    if e.target.name == 'text'
      @setState text_limit: 120 - e.target.value.length
  valid: ->
    @state.text && @state.text_limit >= 0
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '',{message: @state},(data)=>
      @props.handleNewMessage data
      @setState @getInitialState()
    , 'JSON'
  toggleUnit: (e) ->
    @setState important: !@state.important
  render: ->
    React.DOM.div
      className: "row"
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: "col-md-6"
          React.DOM.div
            className: 'form-group'
            React.DOM.textarea
              className: 'form-control'
              type: 'area'
              placeholder: 'message'
              name: 'text'
              value: @state.text
              onChange: @handleValueChange
            React.DOM.span
              className: "hint"
              "120/"+@state.text_limit
        React.DOM.div
          className: "col-md-4"
          React.DOM.a
            className: 'btn btn-primary'
            onClick: @toggleUnit
            'important = ' + @state.important.toString()
        React.DOM.div
          className: "col-md-2"
          React.DOM.button
            type: "submit"
            className: "btn btn-primary"
            disabled: !@valid()
            'Create Message'
