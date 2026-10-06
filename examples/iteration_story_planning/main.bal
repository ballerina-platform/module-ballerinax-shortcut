// Plans a sprint: reads the workspace workflow, creates an iteration, adds a story to it and refines the story.

import ballerina/io;
import ballerinax/shortcut;

configurable string shortcutToken = ?;
configurable string iterationName = ?;
configurable string iterationStartDate = ?;
configurable string iterationEndDate = ?;
configurable string storyName = ?;
configurable string storyDescription = ?;
configurable int storyEstimate = 3;
configurable boolean createResources = false;

public function main() returns error? {
    shortcut:Client shortcutClient = check new ({shortcutToken});

    // Step 1: find the default workflow state for new stories
    shortcut:Workflow[] workflows = check shortcutClient->listWorkflows();
    if workflows.length() == 0 {
        return error("No workflows found in the workspace");
    }
    shortcut:Workflow workflow = workflows[0];
    io:println("Using workflow: ", workflow.name, " (default state ", workflow.defaultStateId, ")");

    if !createResources {
        io:println("createResources is false; set it to true to create the iteration and story.");
        return;
    }

    // Step 2: create the iteration
    shortcut:Iteration iteration = check shortcutClient->createIteration({
        name: iterationName,
        startDate: iterationStartDate,
        endDate: iterationEndDate
    });
    io:println("Created iteration ", iteration.name, " with ID ", iteration.id);

    // Step 3: create a story inside the iteration
    shortcut:Story story = check shortcutClient->createStory({
        name: storyName,
        description: storyDescription,
        storyType: "feature",
        workflowStateId: workflow.defaultStateId,
        iterationId: iteration.id
    });
    io:println("Created story ", story.name, " with ID ", story.id);

    // Step 4: set the estimate on the story
    shortcut:Story updated = check shortcutClient->updateStory(story.id, {estimate: storyEstimate});
    io:println("Story estimate is now ", updated.estimate);
}
