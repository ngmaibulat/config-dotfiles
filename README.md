
### Overview

Contains config files and script to copy configs to their locations at home folder.

Some config files might have multiple variations. In such cases, you can adjust the `setup.sh` script
and choose the best config file to copy.

### Workflow

- Consider, backup of your configs. They can be overwritten!
- Clone repo
- Run `setup.sh` script

### Alternate approaches

- Backup whole home folder -- tons of rubbish copied. Lot's of caches or system-specific stuff, which are not portable to other systems.
- Ansible playbook with templates -- slower in maintenance.
- Put home folder in git repo -- same result as option 1.
- Put .config folder in git repo -- some configs are outside of .config. Still some rubbish in .config
- Have a copy of configs and use symlinks. In practice, not the easiest to maintain. Sometimes, experiments should NOT be change the config repo.

### This approach

- allows any expirements/testing on actual systems
- allows to peak/choose usefull configs and put them into repo
- the setup script is very simple and adjustable on actual systems
- you can also include system-wide configs as well
- many configs are actually not referenced by `setup.sh`, so they can be `installed` manually or via customized `setup.sh`
- `setup.sh` is intended to be kept minimal/simpler
- repo is public - so it can be cloned from anywhere
- if you need very minor modifications -- you can do so in-place
- if you need more modifications - just fork the repo and do so

