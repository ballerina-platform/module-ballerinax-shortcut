# Iteration story planning

This example plans a sprint in Shortcut. It reads the workspace workflow to find the default workflow state, creates an iteration, adds a story to the iteration and then sets the story's estimate. Resources are only created when `createResources` is set to `true`.

## Prerequisites

### 1. Create a Shortcut API token

Generate an API token in Shortcut under **Settings > Your Account > API Tokens**.

### 2. Configuration

Create a `Config.toml` file in this example's directory with the following content:

```toml
shortcutToken = "<shortcut-api-token>"
iterationName = "<iteration-name, e.g. Sprint 44>"
iterationStartDate = "<start-date, e.g. 2026-10-12>"
iterationEndDate = "<end-date, e.g. 2026-10-23>"
storyName = "<story-name>"
storyDescription = "<story-description>"
storyEstimate = 3
createResources = false
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```
