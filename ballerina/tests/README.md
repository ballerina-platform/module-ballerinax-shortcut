# Running Tests

## Prerequisites

The tests run against a mock Shortcut service by default and need no credentials. To run them against the live API, create a Shortcut API token and export it as shown below.

## Test environments

| Mode | Command | Credentials |
|------|---------|-------------|
| Mock server (default) | `bal test` | none |
| Live server | `bal test` with the variables below | `SHORTCUT_API_TOKEN` |

```bash
export IS_LIVE_SERVER=true
export SHORTCUT_API_TOKEN=<Shortcut API token>
```

## Coverage

The suite covers 25 operations: categories, epics, stories (create, get, update, delete), labels, members, workflows, iterations and story search. Delete tests create their own fixture and are skipped against the live server.
