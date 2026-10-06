# Epic progress report

This example reports on epic progress in Shortcut. It lists every epic with its done and total story counts, reads the first epic in full to show its deadline, and runs a story search with the configured query.

## Prerequisites

### 1. Create a Shortcut API token

Generate an API token in Shortcut under **Settings > Your Account > API Tokens**.

### 2. Configuration

Create a `Config.toml` file in this example's directory with the following content:

```toml
shortcutToken = "<shortcut-api-token>"
searchQuery = "<story-search-query, e.g. is:started owner:me>"
searchPageSize = 25
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```
