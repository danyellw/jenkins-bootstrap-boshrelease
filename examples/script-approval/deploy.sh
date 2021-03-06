#!/bin/bash
flags=$*
branch=${GIT_BRANCH:-master}

bosh deploy ${flags} --deployment jenkins ../../deployment/jenkins.yml \
  --ops-file ../../deployment/operations/enable-config-repository.yml \
  --ops-file ../../deployment/operations/set-config-repository-branch.yml \
  --ops-file ../../deployment/operations/set-config-repository-path.yml \
  --ops-file ../../deployment/operations/master-only.yml \
  --vars-file ${PWD}/vars.yml \
  --var deployment_name=jenkins \
  --var config_repo_branch=${branch}
