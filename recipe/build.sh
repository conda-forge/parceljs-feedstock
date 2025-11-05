#!/bin/sh

set -exuo pipefail

if [[ "${target_platform}" == "osx-arm64" ]]; then
  export npm_config_arch="arm64"
fi
# Don't use pre-built gyp packages
export npm_config_build_from_source=true

if [[ "${target_platform}" == linux-* ]]; then
  # We need to be more permissive to get the code compiling
  export CFLAGS="${CFLAGS} -fpermissive"
  export CXXFLAGS="${CXXFLAGS} -fpermissive"
fi

rm $PREFIX/bin/node
ln -s $BUILD_PREFIX/bin/node $PREFIX/bin/node

export NPM_CONFIG_USERCONFIG=/tmp/nonexistentrc

yarn pack
yarn licenses generate-disclaimer --production > ThirdPartyLicenses.txt

exit 1

npm install --os_linux_compiler=${CC} --build-from-source -g parcel-v${PKG_VERSION}.tgz
# Delete pre-build
rm $PREFIX/lib/node_modules/parcel/node_modules/@parcel/source-map/parcel_sourcemap_node/artifacts/index.linux-arm64-gnu.node
