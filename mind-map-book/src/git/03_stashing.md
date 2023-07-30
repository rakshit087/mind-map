# Stashing Files

`git stash` temporarily saves changes we have made to our files so that we can work on something else, and then come back and `unstash` those changes.

### How is stashing useful?

let’s say we have two branches and we are working on branch A, now when we switch to branch B, all the uncommitted files (staged / unstaged) will either get copied to branch B or we’ll get an error. To resolve this issue we can either first commit to branch A or we can `stash` those files and then move to branch B. The stashed files will not effect branch B, and can be restored when we move back to branch A.

### Stashing Files

```bash
git stash
```

When we run git stash, all the staged files will go to stash area. By default, unstaged files will not be stashed. Adding the `-u` option (or `--include-untracked`) tells `git stash` to also stash your untracked files

## Restoring Stash

```bash
git stash pop
```

This will restore the last changes added to stash

### Cleaning Stash