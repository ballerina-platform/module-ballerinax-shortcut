## Overview

[Shortcut](https://shortcut.com/) is a project management platform for software teams that organizes work into stories, epics, iterations and objectives. The Shortcut REST API (version 3) gives programmatic access to that work.

The Shortcut connector lets Ballerina applications read and manage stories, epics, iterations, labels, groups, milestones, objectives, documents, workflows and workspace members, and search across them.

### Key features

- Create, update, search and delete stories, tasks, comments and story links
- Plan work with epics, iterations, milestones, objectives and categories
- Organize work with labels, groups, projects and custom fields
- Read workspace members, workflows and repositories
- Manage files, linked files, documents and entity templates

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
