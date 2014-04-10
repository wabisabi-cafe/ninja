storage.methods =
  value: null

  validator: ->
    return true

  handlers: [
    {
      ###
      # Save data
      ###
      name: "save"

      handler: ( key, value ) ->
        saveData key, value, @access key

        # Use localStorage
        if support.storage
          if typeof key is "string"
            oldVal = this.access key

            localStorage.setItem key, escape if $.isPlainObject(oldVal) then JSON.stringify($.extend oldVal, val) else val
        # Use cookie
        # else

      validator: ( key ) ->
        return $.isString key
    },
    {
      ###
      # Access data
      ###
      name: "access"

      handler: ->
        key = arguments[0]

        if typeof key is "string"
          # localStorage
          if support.storage
            result = localStorage.getItem key

            if result isnt null
              result = unescape result

              try
                result = JSON.parse result
              catch error
                result = result
          # Cookie
          # else

        return result || null
    },
    {
      name: "clear"

      handler: ->
    }
  ]
