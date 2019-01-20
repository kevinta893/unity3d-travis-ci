# unity3d-travis-ci
[![Build Status](https://travis-ci.org/kevinta893/unity3d-travis-ci.svg?branch=2017.2.0f3)](https://travis-ci.org/kevinta893/unity3d-travis-ci)
[![unity version](https://img.shields.io/badge/unity%20version-2017.2.0f3-green.svg)]()

A simple example on how to use Travis-CI to build, test, and deploy a Unity Package to a Github Release. The example Unity Package is a scene with a cube bouncing. 

It works by using a Mac OS X version of Unity. This version does not require signing in to build a unity package (unlike the Windows and Linux versions). Travis-CI then builds the project as a Windows 64-bit player and runs test cases against the player. See https://docs.unity3d.com/Manual/testing-editortestsrunner.html for executing a test script in a Unity build. Then a Unity package is built and deployed to a GitHub release when all test cases successfully pass.

I recommend reading a more detailed explaination on how to do this through this blog post: https://hackernoon.com/writing-an-open-source-unity-package-877bad3c8913

## Configuration

Do configure the `.travis.yml` file to your needs:

* TRAVIS_TAG - the GitHub release tag to deploy, if a release already exists with the same tag the release ZIP folder will be replaced
* UNITY_PROJECT_NAME - the name of the release, the ZIP folder will be named ```$UNITY_PROJECT_NAME-v$TRAVIS_TAG```

## Picking a Unity Version

To choose a different Unity version to compile with, first visit the [Unity Download Archive](https://unity3d.com/get-unity/download/archive) and get the download URL for the following:

* The **Unity Editor** (not installer) Mac OS package
* The **Windows Target Support** Mac OS package (click on Release Notes for a list of links)

Then go to **travis-build\install_unity.sh** and add these URLs to the respective enviroment variables: `UNITY_OSX_PACKAGE_URL` and `UNITY_WINDOWS_TARGET_PACKAGE_URL`

## Other notes

It is possible to upgrade the version of Unity used in Travis-CI. See `install_unity.sh`. Not all Unity versions may be supported. 
