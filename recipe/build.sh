yarn pack
yarn licenses generate-disclaimer --production > ThirdPartyLicenses.txt
NPM_CONFIG_USERCONFIG=/tmp/nonexistentrc
npm install --os_linux_compiler=${CC} --build-from-source -g parcel-v${PKG_VERSION}.tgz
# Delete pre-build
rm $PREFIX/lib/node_modules/parcel/node_modules/@parcel/source-map/parcel_sourcemap_node/artifacts/index.linux-arm64-gnu.node
