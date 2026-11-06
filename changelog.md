# Changelog

All notable changes to this project are documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Remote methods for Docs: `listDocs`, `createDoc`, `getDoc`, `updateDoc`, `deleteDoc`, `searchDocuments`, `listDocumentEpics`, `linkDocumentToEpic`, `unlinkDocumentFromEpic` and `listEpicDocuments`.
- Remote methods for Objectives and Key Results: `listObjectives`, `createObjective`, `getObjective`, `updateObjective`, `deleteObjective`, `listObjectiveEpics`, `searchObjectives`, `getKeyResult` and `updateKeyResult`.
- Remote methods for health status: `getEpicHealth`, `createEpicHealth`, `listEpicHealths`, `getObjectiveHealth`, `createObjectiveHealth`, `listObjectiveHealths` and `updateHealth`.
- Remote methods for custom fields: `listCustomFields`, `getCustomField`, `updateCustomField` and `deleteCustomField`.
- Remote methods for generic integrations: `createGenericIntegration`, `getGenericIntegration` and `deleteGenericIntegration`.
- `listEpicsPaginated`, `listCategoryObjectives`, `searchIterations`, `searchMilestones`, `uploadFiles`, `createStoryFromTemplate`, `listStoryComment`, `listStorySubTasks` and `unlinkCommentThreadFromSlack`.
- The records these methods use, such as `Doc`, `DocSlim`, `Objective`, `KeyResult`, `Health`, `CustomField`, `UploadFilesRequest` and `CreateStoryFromTemplateParams`.
- A `*Queries` record for each operation that takes query parameters, such as `SearchQueries`, `ListEpicsQueries` and `ListMembersQueries`. In 1.5.2 these methods took no query parameters at all, so options such as `includesDescription`, `archived`, `slim` and `orgPublicId` could not be sent.
- An optional `headers` parameter on every remote method, for sending extra request headers.
- New `ConnectionConfig` fields, taken from `http:ClientConfiguration`: `followRedirects`, `cookieConfig`, `socketConfig` and `laxDataBinding`.

### Changed

- **Breaking:** the default `serviceUrl` is `https://api.app.shortcut.com/api/v3` (was `https://api.app.shortcut.com/`). A custom `serviceUrl` must now include the `/api/v3` path.
- **Breaking:** `searchStoriesOld` is renamed to `queryStories`.
- **Breaking:** `search`, `searchEpics` and `searchStories` take a required `query` argument, and `getExternalLinkStories` a required `externalLink` argument, which 1.5.2 could not send:

    ```ballerina
    // 1.5.2
    shortcut:StorySearchResults results = check shortcut->searchStories();
    ```

    ```ballerina
    // 2.0.0
    shortcut:StorySearchResults results = check shortcut->searchStories(query = "state:started", pageSize = 25);
    ```

- **Breaking:** `deleteMultipleStories` takes a `DeleteStories` payload, and `deleteStoryReaction` a `CreateOrDeleteStoryReaction` payload, carrying the stories and the emoji to delete.
- **Breaking:** the delete methods and `disableStoryTemplates`, `enableStoryTemplates`, `disableIterations` and `enableIterations` return `error?` (was `http:Response|error`).
- **Breaking:** record fields use camel case, mapped to the API's snake-case JSON names with `@jsondata:Name`. For example, `Story.workflow_state_id` is now `workflowStateId`, `Epic.app_url` is now `appUrl`, and `CreateStoryParams.owner_ids` is now `ownerIds`.
- **Breaking:** `EpicSearchResults.data` is an `EpicSearchResult[]` (was `Epic[]`), `StorySearchResults.data` a `StorySearchResult[]` (was `Story[]`), and `SearchResults.stories` is optional.
- **Breaking:** `History.actions` is a `HistoryActions[]`, a union of the `HistoryAction*` records (was `record {}[]`), and the `id` of the `HistoryReference*` records is `int|string` (was `int`).
- **Breaking:** `CreateStoryContents.tasks` and `UpdateStoryContents.tasks` are `BaseTaskParams[]` (was `EntityTemplateTask[]`).
- **Breaking:** `CreateCategory.'type` is optional and typed `anydata` (was a required `string`).
- **Breaking:** fields that were `string` are typed as string-literal unions of the values the API accepts, for example the `state` of `CreateEpic`, `UpdateEpic`, `CreateMilestone` and `UpdateMilestone`, the `verb` of the story-link records, `CreateLinkedFile.'type`, `Member.state`, `Repository.'type` and the `action` of the `HistoryAction*` records.
- **Breaking:** `ConnectionConfig.http1Settings` is now `http:ClientHttp1Settings` (was the connector's own `ClientHttp1Settings`).
- `ConnectionConfig.timeout` defaults to 30 seconds (was 60).

### Removed

- **Breaking:** `unlinkProductboardFromEpic`, `disableGroups` and `enableGroups`, whose endpoints the API no longer defines.
- **Breaking:** the array aliases `CategoryArr`, `EntityTemplateArr`, `EpicSlimArr`, `GroupArr`, `HistoryArr`, `IterationSlimArr`, `LabelArr`, `LinkedFileArr`, `MemberArr`, `MilestoneArr`, `ProjectArr`, `RepositoryArr`, `StoryReactionArr`, `StorySlimArr`, `ThreadedCommentArr`, `UploadedFileArr` and `WorkflowArr`. Use the element type's array, for example `StorySlim[]`.
- **Breaking:** the `GetEpicStories`, `GetExternalLinkStoriesParams`, `GetIterationStories`, `GetLabelStories`, `GetMember`, `GetProjectStories`, `ListEpics`, `ListGroupStories`, `ListLabels`, `ListMembers` and `Search` records, which no method used. Their parameters are now passed through the `*Queries` records.
- **Breaking:** the `EntityTemplateTask`, `MaxSearchResultsExceededError` and `UnusableEntitlementError` records.
- **Breaking:** fields that the API no longer defines: `cursors` on `EpicSearchResults` and `StorySearchResults`, `average_cycle_time` and `average_lead_time` on `EpicStats`, `Group.story_workflow_ids`, `Commit.merged_branch_ids`, `HistoryActionStoryCommentCreate.text`, and `entity_type`, `files`, `linked_files` and `label_ids` on `CreateStoryContents` and `UpdateStoryContents`.
- **Breaking:** the connector's own `ClientHttp1Settings` and `ProxyConfig` records. Use `http:ClientHttp1Settings` and `http:ProxyConfig` instead.
