# Basics of Git

### Initializing Git Repo

A git repository allows us to track version and changes in files of that repository. To initialize a empty git repository:

```bash
git init
```

### Staging files (Tracking)

The git repository will be able to save history of files which are added to the `staged area`. To stage a specific file

```bash
git add file.txt
```

To stage multiple files

```bash
git add file.txt file2.txt
```

To stage all the files in git repository

```bash
git add .
```

### Making a Commit

When we make a commit all the tracked files will get a save-point. In simpler terms we will be able to move to any commit if we want to. So if something goes wrong, we can revert to a previous commit where everything worked.

To make a commit:

```bash
git commit -m "This is my commit"
```

The `-m "This is my commit"` is the message given to the commit. This works as a way for us to identify what was added in that commit.

### Removing files from being tracked

```bash
git restore --staged file.txt
```

### Checking status of our git repository

We can check how many files are being tracked, how many of them are modified since previous commit, and a lot more information by

```bash
git status
```

### The Git Log

We can check all the commits, their authors, time, date etc. by

```bash
git log
```

When we git log, it will also print the hash of the commit. This hash is a unique id of commit and used to identify commits.

```bash
commit 4dc6314d74d5ba0e501e6d1bee220a9e7910539a (HEAD -> master, origin/master, origin/HEAD)
Author: Rakshit <rakshit087@gmail.com>
Date:   Sun Feb 6 01:51:21 2022 +0530

    Color Flood

commit 3b1ef3ffbe820849e454ae17cfd9b5657e3d8f2f
Author: Rakshit <rakshit087@gmail.com>
Date:   Thu Feb 3 23:51:46 2022 +0530

    N Queen
```

Here `Color Flood` , `N Queen` are the messages we wrote while committing. The string `4dc6314d74d5ba0e501e6d1bee220a9e7910539a`  is the hash id of the commit with the message `Color Food`.