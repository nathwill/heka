require "cjson"

function process_message()
  local msg = decode_message(read_message("raw"))

  inject_payload("json", "", cjson.encode(msg))
  return 0
end
