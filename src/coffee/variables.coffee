$ = Miso.__builtIn__

# JavaScript APIs' support
support =
  # JSON
  json: $.hasProp(window, "JSON") and $.isFunction JSON.parse
  # Web Storage
  storage: !!window.localStorage

# storage for internal usage
storage =
  methods: null
