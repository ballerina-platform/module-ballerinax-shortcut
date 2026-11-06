// Reports on epic progress: lists every epic with its story counts and runs a story search.

import ballerina/io;
import ballerinax/shortcut;

configurable string shortcutToken = ?;
configurable string searchQuery = ?;
configurable int searchPageSize = 25;

public function main() returns error? {
    shortcut:Client shortcutClient = check new ({shortcutToken});

    // Step 1: list the epics and print their progress
    shortcut:EpicSlim[] epics = check shortcutClient->listEpics();
    foreach shortcut:EpicSlim epic in epics {
        int done = epic.stats.numStoriesDone;
        int total = epic.stats.numStoriesTotal;
        io:println(epic.name, " [", epic.state, "]: ", done, " of ", total, " stories done");
    }

    // Step 2: read the first epic in full
    if epics.length() > 0 {
        shortcut:Epic firstEpic = check shortcutClient->getEpic(epics[0].id);
        io:println("Deadline of ", firstEpic.name, ": ", firstEpic.deadline ?: "not set");
    }

    // Step 3: search stories matching the query
    shortcut:StorySearchResults results = check shortcutClient->searchStories(query = searchQuery, pageSize = searchPageSize);
    io:println("Found ", results.total, " matching stories; showing ", results.data.length());
    foreach shortcut:StorySearchResult story in results.data {
        io:println("- ", story.name, " (", story.storyType, ")");
    }
}
