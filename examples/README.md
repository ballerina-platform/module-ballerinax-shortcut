# Examples

The `ballerinax/shortcut` connector provides practical examples illustrating usage in various scenarios.

1. [Iteration story planning](./iteration_story_planning/iteration_story_planning.md) - Create an iteration, add a story to it and set its estimate.
2. [Epic progress report](./epic_progress_report/epic_progress_report.md) - Report story progress for every epic and search stories.

## Prerequisites

Create a Shortcut API token and set it as `shortcutToken` in each example's `Config.toml`. See the example documents for the remaining configuration.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
