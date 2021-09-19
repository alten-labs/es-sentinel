-- API provided by C
-- Log(loglevel: int, fmt: string, ...): added in APILevel 1
-- TODO
-- added in APILevel 1
function IsPosix() return OperatingSystem == 'linux' or OperatingSystem == 'osx' end

-- PathSep is an internal variable
if IsPosix() then
    PathSep = '/'
elseif OperatingSystem == 'windows' then
    PathSep = '\\'
end

function EntryPoint(compiler, full_path, argv)
    Log(1, "Hello world")
    return {}
end
