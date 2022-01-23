############################
##    Docker functions    ##
############################

function Show-Containers { docker ps }

function Show-AllContainers { docker ps -a }

# Source: https://gist.github.com/sixeyed/adce79b18c5f572feaf34ae9e90513c2

function Remove-StoppedContainers {
	foreach ($id in & docker ps -a -q) { 
		& docker rm $id 
	}
}

function Remove-DanglingImages {
	foreach ($id in & docker images -q -f 'dangling=true') { 
		& docker rmi $id 
	}
}

function Remove-DanglingVolumes {
	foreach ($id in & docker volume ls -q -f 'dangling=true') { 
		& docker volume rm $id 
	}
}

############################
##      Git functions     ##
############################

function Show-GitStatus { git status }

function Show-GitBranches { git branch }

function Add-AllChangesToStage { git add . }

function Set-SignedCommitWithMessage { git commit -sm $args }

function Show-GitLogOneLine { git log --oneline }

function Push-ToCurrentBranch {
	$branch = git branch --show-current
	git push origin $branch
}

function Show-GitConflicts { git diff --name-only --diff-filter=U }

function Set-BranchToMain { git checkout main }

# Source: https://dev.to/bowmanjd/get-github-default-branch-from-the-command-line-powershell-or-bash-zsh-37m9
function Set-BranchToDefault { 
	$branch = (git symbolic-ref refs/remotes/origin/HEAD) -split '/' | Select-Object -Last 1
	git checkout $branch
}

############################
##         Aliases        ##
############################

Set-Alias vim "C:\Program Files (x86)\Vim\vim82\vim.exe"

Set-Alias d docker
Set-Alias drmdi Remove-DanglingImages
Set-Alias dps Show-Containers
Set-Alias dls dps
Set-Alias dpsa Show-AllContainers
Set-Alias drmc Remove-StoppedContainers
Set-Alias drmdv Remove-DanglingVolumes

Set-Alias gs Show-GitStatus
Set-Alias gb Show-GitBranches
Set-Alias gaa Add-AllChangesToStage
Set-Alias gcsm Set-SignedCommitWithMessage
Set-Alias glo Show-GitLogOneLine
Set-Alias gpb Push-ToCurrentBranch
Set-Alias gdef Set-BranchToDefault
Set-Alias gmain Set-BranchToMain
Set-Alias gcon Show-GitConflicts

############################
##     Quick paths        ##
############################

function Set-LocationGoPath { Set-Location C:\Users\shubhash\source\repos\go\src\ }
Set-Alias cdgo Set-LocationGoPath

############################
##        Starship        ##
############################

$env:STARSHIP_CONFIG = ".\starship.toml"

# Set-PoshPrompt -Theme zash
Invoke-Expression (&starship init powershell)
