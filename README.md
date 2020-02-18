# Jenkins Docker image for the Jenkins X instances of the QA team

This repository allows to build the `nuxeo/qa-jenkinsx` image to be used in the `qa` Jenkins X team.

See how the image is pulled in the [Jenkins X environment description](https://github.com/nuxeo/jx-qa-env/blob/master/values.yaml).

## Plugins

The Jenkins plugins installed in the image are listed in [plugins.txt](plugins.txt).

## Configuration

The configuration of Jenkins and its plugins is in the [config](config) directory and relies on the [Jenkins Configuration as Code Plugin](https://github.com/jenkinsci/configuration-as-code-plugin/).

## Updating the Jenkins X Environment

When opening a pull request (A) in the current repository, a new version of the Jenkins image is built with the following pattern:

```shell
x.y.z-PR-a-b
```

Then, you can and open a draft pull request (B) in the [jx-qa-env](https://github.com/nuxeo/jx-qa-env/) repository to use this new version in [values.yaml](https://github.com/nuxeo/jx-qa-env/blob/master/values.yaml):

```yaml
jenkins:
  Master:
    ...
    ImageTag: x.y.z-PR-a-b
```

This will trigger an upgrade of the `qa-staging` team with the new version of the Jenkins image, to be able to validate it.

When the `qa-staging` team is validated, the (B) pull request can be safely closed and the (A) pull request can be merged. This builds a release version of the Jenkins image and opens a pull request (C) in the [jx-qa-env](https://github.com/nuxeo/jx-qa-env/) repository to use this release version.

The (C) pull request can then be merged to trigger an update of the `qa` team with the release version of the Jenkins image.
