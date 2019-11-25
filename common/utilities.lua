--
-- User: Glastis
-- Date: 15-Nov-19
--

local file = require('common.file')

local utilities = {}

local function trim(str)
    return str:gsub("^%s+", ""):gsub("%s+$", "")
end
utilities.trim = trim

local function get_elem_in_table(table, elem)
    local i

    i = 1
    while i <= #table do
        if table[i] == elem then
            return i
        end
        i = i + 1
    end
    return false
end
utilities.get_elem_in_table = get_elem_in_table

local function concatenate_arrays(t1, t2)
    local i

    i = 1
    while i <= #t2 do
        t1[#t1 + 1] = t2[i]
        i = i + 1
    end
    return t1
end
utilities.concatenate_arrays = concatenate_arrays

local function split(str, separator)
    local t = {}
    local i

    i = 1
    for line in string.gmatch(str, "([^" .. separator .. "]+)") do
        t[i] = line
        i = i + 1
    end
    return t
end
utilities.split = split

local function exec_function_table(actions, param)
    local i

    i = 1
    if not param then
        param = {}
    end
    while i <= #actions do
        actions[i](param[i])
        i = i + 1
    end
end
utilities.exec_function_table = exec_function_table

local function exec_function_table_revert(actions, param)
    local i

    i = #actions
    if not param then
        param = {}
    end
    while i > 0 do
        actions[i](param[i])
        i = i - 1
    end
end
utilities.exec_function_table_revert = exec_function_table_revert

local function debug_info(more, calltrace)
    if not more then
        more = " "
    end
    if calltrace then
        local trace

        trace = split(split(debug.traceback(), '\n')[3], '/')
        file.write("trace.log", '\n' .. trace[#trace] .. '\n' .. more .. '\n')
    else
        file.write("trace.log", more .. '\n')
    end
end
utilities.debug_info = debug_info

local function var_dump_indent(depth)
    local ret

    ret = ''
    while depth > 0 do
        ret = ret .. '  '
        depth = depth - 1
    end
    return ret
end

local function var_dump(var, printval, max_depth, cur_depth)
    if max_depth == nil then
        max_depth = 1000
    end
    if not cur_depth then
        cur_depth = 0
    end
    if type(var) == 'table' then
        local s

        s = '{ '
        for k,v in pairs(var) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            if max_depth > 0 then
                s = s .. '\n' .. var_dump_indent(cur_depth) .. '[' .. k .. '] = ' .. var_dump(v, false, max_depth - 1, cur_depth + 1) .. ','
            else
                s = s .. '\n' .. var_dump_indent(cur_depth) .. '[' .. k .. '] = ' .. tostring(v) .. ','
            end
        end
        if printval then
            print(tostring(s .. '\n}'))
        end
        return s .. '\n' .. var_dump_indent(cur_depth - 1) .. '} '
    end
    if printval then
        print(tostring(var))
    end
    return tostring(var)
end
utilities.var_dump = var_dump

local function round(number, decimals, ext_abs)
    if ext_abs then
        ext_abs = math.floor
    else
        ext_abs = math.ceil
    end
    if not decimals then
        return ext_abs(number)
    end
    decimals = 10 ^ decimals
    return ext_abs(number * decimals) / decimals
end
utilities.round = round

local function usleep(ms)
    local start_time
    local end_time

    start_time = system.getTimer()
    end_time = start_time + ms
    while true do
        if system.getTimer() >= end_time then
            break
        end
    end
end
utilities.usleep = usleep

return utilities
