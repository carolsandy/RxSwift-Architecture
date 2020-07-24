# Contributing

**Help us to create clean, maintainable & testable code!**

If you would like to contribute code to this repository you can do so through GitHub by
forking the repository and sending a pull request or opening an issue.

When submitting code, please make every effort to follow existing conventions
and style in order to keep the code as readable as possible. Please also make
sure your code compiles, passes the tests and the checkstyle configured for this repository.

## Some tips that will help you to contribute to this repository:

* Read Workflow
* Write clean code and test it.
* Follow the repository code style.
* Write good commit messages.
* Use our [PULL_REQUEST_TEMPLATE](https://github.com/justomx/ios/blob/master/.github/PULL_REQUEST_TEMPLATE.md) to create a Pull Requests
* Do not send pull requests without checking if the project build is OK in Circle-CI.
* Review if your changes affects the repository documentation and update it.
* Describe the PR content and don't hesitate to add comments to explain us why you've added or changed something.

## Workflow

### Branches

* Our main branch is `master`
* We work on `feature branches` and do PRs to merge them to master.
* Every ticket in JIRA linked to a merged PR should set the field "Fix Version/s:" to the next Release. This will help to generate automatically the changelog at the end of each release
* We use a release branch to prepare the Release Candidates, Bug bash, HotFix and finally do the Release.

### Pull Request

* Guide the reviewers on how to test the new feature, the screens that are affected, how to access them. If there is any context requirement (user logged in, malfunctioning API, etc) specify how did you test it.

* All pull requests must have screenshots of the new screens or UI changes if any. It is recommended to show changes on different devices and resolutions (small phones, tablets).

* If there are animations involved, record them and upload them to the PR.

* Specify if there are changes in any DB schema and how the evolution is being performed.

* If there is any change on how the app communicates with the server, link to the documentation of the endpoint being used.

* Include new permissions being requested to users.


Label | Description | Who should put it
----- | ----------- | -----------------
![#FFD03B](https://placehold.it/15/fbc02d/000000?text=+) `WIP` | The PR is WorkInProgress. This is the default label that should be used as soon as a new task is started (other developers can start reading code before a PR is completed). | **Owner** of the PR
![#C5E4CE](https://placehold.it/15/005b9f/000000?text=+) `waiting review` | The PR is waiting for feedback, if it gets 2 approvals it should become `ready to merge`. If changes are requested the owner should work on them, or can decide to change the label back to WIP until he/she can do the changes. | **Owner** of the PR
![#00952B](https://placehold.it/15/00796b/000000?text=+) `ready to merge` | The **owner** of the PR can merge the PR. This state exists to give him the opportunity to read non-blocking comments and do some small changes. Don't forget to remove the 'waiting review' label when applying this one so the PR is removed from the list of PRs to review.| **2nd approver**, after having approved, but also anyone who sees 2 approvals on a PR can put this label
![#FF2C35](https://placehold.it/15/c2185b/000000?text=+) `HOTFIX` | Not part of the workflow, just a way to ask for a URGENT review because the change is solving an issue. | **Owner** of the PR or anyone who thinks the review of this PR is urgent

Each of us should do Code Review at least twice a day.
Whenever we start a Code Review we should assign ourselves to the PR so the next reviewer knows that there is already 2 reviewers and can skip this PR.
The review should be done using the [pull request review](https://help.github.com/enterprise/2.8/user/articles/about-pull-request-reviews/) from github, not the "single comment" and ends with a Reject or Approval.
Having approval or reject helps because you can see them on list of checks:
![checks](https://github-images.s3.amazonaws.com/enterprise/2.8/assets/images/help/pull_requests/merge_box/pr-reviews-in-merge-box.png)

If your PR has UI-related changes, please, add screenshots before and after changes, so that reviewers can see everything looks fine.

We don't allow new issues, so Circle CI is required check to merge the PR.


## Enrich your PR with screenshots and GIFs

If you are changing something on the UI and/or in the flow of the app, adding a screenshot or a GIF can help out reviewers to understand easily what you are changing.

## Issues

* Always include visuals on how the screen should look like (wireframes, mocks, etc).
* Add or link all your new assets to the issue.
* Contemplate common error scenarios such as no internet access, no permissions, etc.
* Include all the translation keys that are needed to implement the new features. Always include the english copy.
* List all the actions that have to be tracked in the new feature if applicable.
* Recommended tags for your issues besides the common ones: _UI_, _DB_, _API_, _STATS_.

## Fixing an issue

* Try to reproduce it.
  * If it’s fixed, indicate when it was resolved.
  * If not, ask for more information on the ticket.

* Attach media resources (images videos) showing how it looked like after your fix.
* Briefly explain what was happening.
* Add tests to assure that the scenario described above shouldn’t happen again.
* Keep track of this issue in the following release to check if it’s fixed if not, update information and reschedule this issue fix.

## Asking for review

Don’t forget you are not your code, the point of establishing a PR process is gathering feedback about how to improve the product you are working.

* Try to fix just one thing at a time.
* Use the template you can find in this repo where you’ll have to introduce the issue you are fixing/developing; what was needed and why the implementation is the way it is.
* Indicate how it can be tested, ideally it should be in an automatic way, but if not, explain why and the tests the reviewer will have to perform in order to check it’s working as expected.
* Indicate how it should be tested by hand. You might have forgotten some scenarios, and the only way to find them out is using exercising that code.
* Be respectful to your colleagues and answer or at least ACK all their comments.

## Reviewing

Think that nobody does their job poorly on purpose (or at least not the most of us). If something is not looking good, try to figure out why almost always there is a reason.

* The best way to have all the context is not the web tool used for PR, checkout the branch and open it.
* Try to understand why it’s done the way it is before suggesting changes.
* Don’t forget that this is about code quality, no about being right. Your comments or suggestion can be declined if there are reasons for so.
* If you can, provide snippets of code showing your idea/suggestion, it’s usually better to discuss it.
* Try to review the PR you have been asked to, your opinion may be relevant, that every developer wants to see their job reflected in the product. The longer a PR is open, the higher the possibility to get conflicts at merge time.

 we will be glad to improve it with your help, thank you 😉 !
