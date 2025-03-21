-- code for web server

local socket = require("socket")

-- Server Configuration
local HOST = "127.0.0.1"
local PORT = 1234

-- Create a TCP socket and bind it to the specified HOST and PORT
local server = assert(socket.bind(HOST, PORT))
print("Server running on http://" .. HOST .. ":" .. PORT)

while true do
    -- Accept a client connection
    local client = server:accept()
    
    -- Receive the HTTP request from the client
    local request = client:receive("*l") -- Read the first line (Request line)
    print("Received request: " .. request)

    -- HTTP Response
    local response = "HTTP/1.1 200 OK\r\n" ..
                     "Content-Type: text/html\r\n" ..
                     "Connection: close\r\n\r\n" ..
                     "<html><body><h1>Hello, Lua Web Server!</h1></body></html>"

    -- Send response to the client
    client:send(response)

    -- Close client connection
    client:close()
end
