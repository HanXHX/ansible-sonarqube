#!/bin/sh

# Thanks to https://servercheck.in/blog/testing-ansible-roles-travis-ci-github

DIR=$( dirname $0 )
PLAYBOOK="$DIR/test.yml"

set -ev

# Check syntax
ansible-playbook -i localhost, -c local --syntax-check -vv $PLAYBOOK


# We can't check this role on travis (docker limitations)

## Check role
#ansible-playbook -i localhost, -c local --sudo -vv $PLAYBOOK
#
## Check indempotence
#ansible-playbook -i localhost, -c local --sudo -vv $PLAYBOOK \
#| grep -q 'changed=0.*failed=0' \
#&& (echo 'Idempotence test: pass' && exit 0) \
#|| (echo 'Idempotence test: fail' && exit 1)
