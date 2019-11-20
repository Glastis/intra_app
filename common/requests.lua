--
-- User: Glastis
-- Date: 16-Nov-19
--

local request = {}

--local net = require 'network'

local function network_callback(event)
    if (event.isError) then
        print("Network error: ", event.response)
    else
        print("RESPONSE: " .. event.response)
    end
end

local function get(url)
    return network.request(url, "GET", network_callback)
end
request.get = get

return request