show_debug_message("obj_gms - Async Networking");
if async_load[?"id"] == global.__socket
{
    switch async_load[?"type"]
    {
        case network_type_data:
            global.__socket_connected = true;
            global.__socket_connecting = false;
            var buffersize = max(0, async_load[?"size"]) + max(0, buffer_tell(_rr));
            
            if buffer_get_size(_rr) <= buffersize
            {
                var newsize = ceil((buffersize + 1) / 2048) * 2048
                buffer_resize(_rr, newsize);
            }
            
            buffer_copy(async_load[?"buffer"], 0, async_load[?"size"], _rr, buffer_tell(_rr));
            buffer_seek(_rr, buffer_seek_start, buffersize);
            break;
    }
}
loadsave = true;

