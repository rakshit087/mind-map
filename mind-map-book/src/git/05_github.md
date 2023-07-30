# Github

GitHub is a place where we can host and share our git repositories.  It can also be used to collaborate on projects.

### Creating a GitHub repository

- Go to https://GitHub.com
- Sign up or login to your account
- On the top right we can see a plus button
- click it and select new repository
- Give your repository a name and click Create Repository

### Connecting a local repository to a new GitHub repository

The first thing we will do is add link of our GitHub repository to our local branch

```bash
git add remote origin "link-of-github"
```

Here `origin` is just an alias given to the URL, and can be used to identify the URL.

To check all the URLs added to our local git, we can use

```bash
git remote -v
```

### Pushing Changes to GitHub Repository

Basically pushing means to upload all the changes we have made in our git to the github, this will include all the commits in it.

```bash
git push <url-alias-where-want-to-push> <name-of-branch-we-want-to-push>
```

Here the name of branch for us `master` and URL alias is `origin` thus the command will be

```bash
git push origin master
```