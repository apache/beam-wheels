# Define custom utilities for deploying on travis

function deploy {
  cd ${TRAVIS_BUILD_DIR}/wheelhouse
  svn co ${BEAM_SVN_DIR}/${VERSION}
  for artifact in *.whl; do
    echo $artifact
    mv $artifact ${VERSION}/${PYTHON_ARTIFACTS_DIR}/$artifact
    svn add ${VERSION}/${PYTHON_ARTIFACTS_DIR}/$artifact
    cd ${VERSION}
    # Your apache credential is needed here in order to upload artifacts into dist.apache.org
    # Please add APACHE_USERNAME and APACHE_SECRET in travis build console > More options > Settings > Environment Variables with 'Display value in build log' disabled.
    # After build finishes, delete your environment variables.
    svn commit --non-interactive --no-auth-cache --username "$APACHE_USERNAME" --password "$APACHE_SECRET" -m "Upload python wheels"
    cd ..
  done
}
