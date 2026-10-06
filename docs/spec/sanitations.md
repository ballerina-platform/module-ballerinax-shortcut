_Author_:  @DimuthuMadushan \
_Created_: 2026/10/06 \
_Updated_: 2026/10/06 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Shortcut.
The OpenAPI specification is obtained from [wso2/api-specs](https://github.com/wso2/api-specs/blob/main/openapi/shortcut/shortcut/v3/openapi.json).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Change the `url` property of the servers object
- **Original**: `https://api.app.shortcut.com`
- **Updated**: `https://api.app.shortcut.com/api/v3`
- **Reason**: Common prefix added to base URL to simplify endpoint paths.

2. Update the API Paths
- **Original**: Paths included common prefix `/api/v3` in each endpoint.
- **Updated**: Common prefix removed from endpoints as it is now in the base URL.
- **Reason**: Simplifies API paths and avoids duplication.

3. Rename schemas
- **Original**: `V3FilesBody` and `MemberInfoOrganization2`.
- **Updated**: `UploadFilesRequest` and `MemberInfoOrganization`.
- **Reason**: The original names were derived from the path or carried a numeric suffix; the new names describe the payload. Decisions are persisted in `ai-mappings.json`.

4. Add missing descriptions
- **Original**: 42 inline request bodies and the `api_token` security scheme had no description.
- **Updated**: Each request body is described as the payload of its operation; the security scheme is described as the API token supplied in the `Shortcut-Token` header.
- **Reason**: Generated documentation for request payloads and client configuration.

5. Add missing descriptions to wrapped `$ref` properties, `globalId` fields, parameters and a request body
- **Original**: The `integrationPublicId` path parameter (`getGenericIntegration`, `deleteGenericIntegration`) and the shared `CreateOrDeleteStoryReaction` request body had no description. About 30 properties that are bare `$ref`s (for example `HistoryChangesStory.workflow_state_id`, `HistoryChangesTask.owner_ids`, `Story.synced_item`, `Profile.display_icon`, `Commit.author_identity`, `EntityTemplate.story_contents`) had no description, and the `global_id` properties (marked `x-doc-skip`) had none either.
- **Updated**: Each now has a short description. The descriptions were written in the aligned spec and copied into the original with `tooling/apply_descriptions.py`, which wraps each `$ref` property as `allOf: [{$ref}]` plus `description`.
- **Reason**: A description beside a bare `$ref` is dropped by OpenAPI 3.0, and the generator emits no doc comment for it. The wrapped form gives every generated field and parameter documentation and removes the "undocumented parameter/field" build warnings. The public types are unchanged.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json -o ballerina --mode client --client-methods remote --license docs/license.txt
```
Note: The license year is hardcoded to 2024, change if necessary.
