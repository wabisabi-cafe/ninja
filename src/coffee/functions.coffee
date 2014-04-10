saveData = ( key, value, old_value ) ->
  if support.storage
    localStorage.setItem key, escape if $.isPlainObject(old_value) then JSON.stringify($.mixin old_value, value) else value
  else if 
