# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git symbolic-ref --short HEAD`
	if [ ! "${BRANCH}" == "" ]
	then
		GIT_BRANCH=`echo ${BRANCH} | awk -F'/' '{ print $NF }'`
		echo "[[1;33m ${GIT_BRANCH}[m]"
	else
		echo ""
	fi
}

function nonzero_return() {
	RETVAL=$?
	if [ $RETVAL -ne 0 ]; then
 		echo "[31m✘-$RETVAL "
	else
		echo "[32m✔ "
	fi
}

export PS1="\`nonzero_return\`\[\e[m\]\u:\w \`parse_git_branch\`\\$ "

