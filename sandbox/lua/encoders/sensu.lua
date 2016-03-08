require "cjson"

local cfg = {
  Level = read_config("level") or "info",
  Status = read_config("status") or 0,
  Handlers = read_config("handlers") or {"default"},
}

function process_message()
  local msg = decode_message(read_message("raw"))

  local sensu_msg = {
    level = cfg.Level,
    message = "publishing check result",
    payload = {
      client = msg.Hostname,
      check = {
        standalone = true,
        command = msg.Type,
        handlers = cfg.Handlers,
        name = msg.Logger,
        issued = msg.Timestamp / 1e9,
        executed = msg.Timestamp / 1e9,
        output = msg.Payload,
        status = cfg.Status,
      }
    }
  }

  inject_payload("json", "", cjson.encode(sensu_msg))
  return 0
end
