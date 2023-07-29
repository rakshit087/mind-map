# Navigating Git

## The Git Graph

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a59233bf-8977-4361-ac85-0659c99e410b/Untitled.png)

Everything we do in a git repository can be represented by a Graph

This graph can also have branches. By default we have one branch called `master` . Our current position (Where we are coding) in the git graph is pointed by a pointer called `Head`.

## Going to a specific commit

To checkout a previous commit, you will use the Git checkout command followed by the commit hash you retrieved from your Git log

```bash
git checkout <commit hash>
```

## Deleting until a Previous Commit

Let’s say in the above graph we want to delete Commit 3 and Commit 2. We can use

```bash
git reset <the hash of commit 1 will come here>
```

All the files of the deleted commits will become `unstaged` files. 

To completely delete those files rather than staging them we can do

```bash
git reset --hard <hash> 
```

Please note: The hash we enter is the hash of the commit where your head should be after deletion.