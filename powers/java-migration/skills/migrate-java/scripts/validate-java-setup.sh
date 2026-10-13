#!/bin/sh

##########################################################################################
# File: validate-java-setup.sh
# Author: Vatsal Gupta
# Description:
#
# Validates the Java environment for a version migration. It reports the active
# JDK, detects the build tool, checks the compiler release configuration, and
# scans compiled classes and dependencies for JDK-internal API usage with jdeps.
#
# Usage:
#   sh validate-java-setup.sh [target-jdk-major]
#
# Example:
#   sh validate-java-setup.sh 21
#
##########################################################################################
##########################################################################################
# License
##########################################################################################
# This script is licensed under the Apache 2.0 License.
##########################################################################################

readonly TARGET_VERSION="${1:-}"

report_jdk() {
    if command -v java >/dev/null 2>&1; then
        echo "Active JDK:"
        java -version 2>&1
    else
        echo "Error: java is not installed or not on PATH." >&2
        return 1
    fi
}

report_build_tool() {
    if command -v mvn >/dev/null 2>&1; then
        echo "Build tool: Maven $(mvn -version 2>&1 | sed -n '1s/^Apache Maven //p')"
    elif command -v gradle >/dev/null 2>&1; then
        echo "Build tool: Gradle $(gradle -version 2>&1 | sed -n 's/^Gradle //p')"
    else
        echo "Build tool: none detected (Maven/Gradle not found)."
    fi
}

report_compiler_release() {
    if [ -f pom.xml ] && command -v grep >/dev/null 2>&1; then
        echo "Maven compiler configuration:"
        grep -E 'maven\.compiler\.(release|source|target)|<release>|<source>|<target>' pom.xml || true
    fi
    if [ -f build.gradle ] && command -v grep >/dev/null 2>&1; then
        echo "Gradle compatibility configuration:"
        grep -E 'sourceCompatibility|targetCompatibility|languageVersion' build.gradle || true
    fi
}

scan_jdk_internals() {
    if ! command -v jdeps >/dev/null 2>&1; then
        echo "jdeps not found; skipping JDK-internals scan."
        return 0
    fi
    echo "Scanning for JDK-internal API usage with jdeps..."
    find . -name '*.jar' -not -path '*/.git/*' -print0 | while IFS= read -r -d '' jar; do
        jdeps --jdk-internals "$jar" 2>/dev/null || true
    done
}

echo "=========================================="
echo "Java migration validation"
if [ -n "${TARGET_VERSION}" ]; then
    echo "Target JDK major version: ${TARGET_VERSION}"
fi
echo "=========================================="

report_jdk || exit 1
report_build_tool
report_compiler_release
scan_jdk_internals

echo "=========================================="
echo "Validation complete."
