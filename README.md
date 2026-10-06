# Ballerina Shortcut connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-shortcut/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-shortcut/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-shortcut.svg)](https://github.com/ballerina-platform/module-ballerinax-shortcut/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/shortcut.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%shortcut)

## Overview

[Shortcut](https://shortcut.com/) is a project management platform for software teams that organizes work into stories, epics, iterations and objectives. The Shortcut REST API (version 3) gives programmatic access to that work.

The Shortcut connector lets Ballerina applications read and manage stories, epics, iterations, labels, groups, milestones, objectives, documents, workflows and workspace members, and search across them.

## Setup guide

To use the Shortcut connector, you need a Shortcut workspace and an API token.

1. Sign in to [Shortcut](https://app.shortcut.com/).
2. Open **Settings** and select **API Tokens** under your account.
3. Enter a name for the token and click **Generate Token**.
4. Copy the token and store it securely. It is shown only once.

## Quickstart

To use the Shortcut connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

```ballerina
import ballerina/io;
import ballerinax/shortcut;
```

### Step 2: Instantiate a new connector

1. Create a `Config.toml` file and configure the token obtained in the steps above:

```toml
shortcutToken = "<Shortcut API token>"
```

2. Create a `shortcut:ApiKeysConfig` and initialize the connector with it.

```ballerina
configurable string shortcutToken = ?;

final shortcut:Client shortcutClient = check new ({shortcutToken});
```

### Step 3: Invoke the connector operation

#### List the epics in the workspace

```ballerina
public function main() returns error? {
    shortcut:EpicSlim[] epics = check shortcutClient->listEpics();
    foreach shortcut:EpicSlim epic in epics {
        io:println(epic.id, ": ", epic.name);
    }
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The `Shortcut` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-shortcut/tree/main/examples/), covering the following use cases:

1. [Iteration story planning](https://github.com/ballerina-platform/module-ballerinax-shortcut/tree/main/examples/iteration_story_planning) - Create an iteration, add a story to it and set its estimate.
2. [Epic progress report](https://github.com/ballerina-platform/module-ballerinax-shortcut/tree/main/examples/epic_progress_report) - Report story progress for every epic and search stories.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`shortcut` package](https://central.ballerina.io/ballerinax/shortcut/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
