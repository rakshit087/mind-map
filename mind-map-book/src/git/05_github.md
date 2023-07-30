# Basics of Remote Git Repository

Remote repos are versions of your project that are hosted on the Internet or network somewhere. You can have several of them, each of which generally is either read-only or read/write for you. Collaborating with others involves managing these remote repositories and pushing and pulling data to and from them when you need to share work.
GitHub is a place where we can host and share our git repositories.  It can also be used to collaborate on projects.

### Creating a GitHub repository

- Go to https://GitHub.com
- Sign up or login to your account
- On the top right we can see a plus button
- click it and select new repository
- Give your repository a name and click Create Repository

### Connecting a local repository to a new Remote repository

The first thing we will do is add link of our Remote repository to our local branch

```bash
git add remote origin "link-of-github"
```

Here `origin` is just an alias given to the URL, and can be used to identify the URL.

To check all the URLs added to our local git, we can use

```bash
git remote -v
```

### Pushing Changes to Remote Repository

Basically pushing means to upload all the changes we have made in our git to the the remote repo, this will include all the commits in it.

```bash
git push <url-alias-where-want-to-push> <name-of-branch-we-want-to-push>
```

Here the name of branch for us `master` and URL alias is `origin` thus the command will be

```bash
git push origin master
```