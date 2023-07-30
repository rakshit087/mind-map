# Branching

Branching in Git allows developers to create independent lines of development, enabling them to work on multiple features or bug fixes simultaneously without affecting the main codebase.

* Create a branch 
```bash
git branch <branch_name>
```

* Switch to a branch
```bash
git checkout <branch_name>
```

* Create and switch to a branch
```bash
git checkout -b <branch_name>
```

* List all branches
```bash
git branch
```

* Delete a branch
```bash
git branch -d <branch_name>
```

* Merge a branch into the active branch
```bash
git merge <branch_name>
```

* Merge a branch into a target branch
```bash
git merge <source_branch> <target_branch>
```

* Show all the commits in the current branch's history
```bash
git log
```
