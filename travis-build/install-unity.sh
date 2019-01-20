#! /bin/sh

# See $BASE_URL/$HASH/unity-$VERSION-$PLATFORM.ini for complete list
# of available packages, where PLATFORM is `osx` or `win`
UNITY_DOWNLOAD_CACHE="$(pwd)/unity_download_cache"
UNITY_OSX_PACKAGE_URL="https://download.unity3d.com/download_unity/0a46ddfcfad4/MacEditorInstaller/Unity-2018.2.12f1.pkg"
UNITY_WINDOWS_TARGET_PACKAGE_URL="https://download.unity3d.com/download_unity/0a46ddfcfad4/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2018.2.12f1.pkg"


download() {

	URL=$1

	#download package if it does not already exist in cache
	if [ ! -e $UNITY_DOWNLOAD_CACHE/`basename "$URL"` ] ; then
		echo "$FILE does not exist. Downloading from $URL: "
		mkdir -p "$UNITY_DOWNLOAD_CACHE"
		curl -o $UNITY_DOWNLOAD_CACHE/`basename "$URL"` "$URL"
	else
		echo "$FILE Exists. Skipping download."
	fi
}

install() {
	PACKAGE_URL=$1
	download $1

	echo "Installing `basename "$PACKAGE_URL"`"
	sudo installer -dumplog -package $UNITY_DOWNLOAD_CACHE/`basename "$PACKAGE_URL"` -target /
}



echo "Contents of Unity Download Cache:"
ls $UNITY_DOWNLOAD_CACHE

echo "Installing Unity..."
install $UNITY_OSX_PACKAGE
install $UNITY_WINDOWS_TARGET_PACKAGE
