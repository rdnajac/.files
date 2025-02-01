# .profile - shell variables and environment settings
PPROC=$(ps -o command= -p "$PPID" | awk '{print $1}')
if [[ "$PPROC" =~ ^(l|g|n)vim$ ]]; then
  exit 1
fi

# add exports here
export MY_EC2_ID=i-#################

echo "The computing scientist's main challenge is not to get confused by the complexities of his own making."
