
function __fish_crystal_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'crystal' ]
    return 0
  end
  return 1
end

function __fish_crystal_commands
  crystal help ^/dev/null | awk '/^Command/{c=99} c&&c--{
		if ($1 != "Command:" ) {
			print $1"\t"substr($0,30)
		}
	}' | sed 's/,//g'
end

complete -c crystal -n '__fish_crystal_needs_command' -f -a '(__fish_crystal_commands)'
