# Progress bar  

> Simple & sexy progress bar for `bash`, give it a duration and it will do the rest.

![progress-bar.sh in action on light terminal](./preview.gif)
![progress-bar.sh in action on dark terminal](./preview-dark.gif)

### Usage

1. Copy to your code or **source**:

        source ./progress-bar.sh

2. Call with a `duration`:

        progress-bar 5

:information_source: Speed can be initially defined by [exporting `SLEEP_DURATION`](tests.bats#L5).

### Why?

1. _I needed one_ ;
1. What I found was _too ugly and too complicated_ ;
1. I wanted **a good UX** ;
1. Check-out [similar projects'](https://github.com/search?l=Shell&o=desc&p=2&q=progress+bar&ref=searchresults&s=stars&type=Repositories&utf8=%E2%9C%93) source code and you'll understand.

### Who use it?

* [byzanz-gui](https://github.com/edouard-lopez/byzanz-gui).

### Test

**Requirements:** [`bats`](https://github.com/sstephenson/bats).

    $ bats ./tests.bats

### License

> MIT dev@edouard-lopez.com.
