yarn pack
yarn licenses generate-disclaimer --production > ThirdPartyLicenses.txt
NPM_CONFIG_USERCONFIG=/tmp/nonexistentrc
npm install --os_linux_compiler=${CC} --build-from-source -g parcel-v${PKG_VERSION}.tgz
