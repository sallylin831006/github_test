# github_test_Sally
- Introduction to all my works


1.Add git ignore and new Xcode project
2.Read the doc about GitHub User API
3.Use Postman to check if GitHub User API is available
4.User singleton to build HttpClient setting
5.Use struct with Codable including images from “avatar_url”, “login”, and “site_admin”.
6.Register nib for tableView and tableView Cell
7.Fetch data and show list in tableView
8.Use Kingfisher for downloading and caching images
9.Found that GitHub User API has already limited results to 100
10.Refactoring from MVC to MVVM
11.Implement detail page when clicking on a user in the list
12.Implement with multithread to better user experience
13.Implement JGProgressHUD to handle error with result type failure
14. I Found let use `?per_page=100` can limit results to 100 users in total.

# **Goal**

List GitHub users.

- [x]  Please find out how to search or retrieve users from GitHub in [GitHub User API](https://docs.github.com/en/rest/reference/users).
- [x]  Show users in list.
- [x]  Limit results to 100 users in total, or you can choose to implement pagination feature (see details in Bonus section).
- [x]  In list, each row should at least show info including image from “avatar_url”, “login”, and “site_admin”.
- [x]  Implement with multithread (e.g. put time-consuming work in background thread, meanwhile your app should be responsive to user input events).
- [x]  Implement in MVVM if possible (or explain for any other architecture of your choice).

# **Bonus**

Please feel free to ignore bonus items if there is no free time.

- [ ]  Implement pagination feature by utilizing [GitHub Pagination](https://docs.github.com/en/rest/guides/traversing-with-pagination), please start from "since=0, page size=20"
- [x]  Upon clicking on an user in the list, open a page for a single user to show more detailed information.
- [x]  Consider how to handle caching or connection issues to improve user experience.

# **Note**

- [x]  Fork this repository to your GitHub account.
- [x]  Add d133579 as collaborator to your private repository.
- [x]  Write a introduction to all your works in [RESPONSE.md](https://github.com/sallylin831006/github_test/blob/develop/RESPONSE.md)
- [x]  Please leave commit messages to let us know how you construct this app.
- [x]  If something is unspecified (UX process, UI specs, ...etc) in exercise, please feel free to make your own assumptions.
- [x]  Third party libs are allowed to use.
