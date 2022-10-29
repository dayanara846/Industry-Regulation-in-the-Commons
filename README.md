# gamepaper
For my ECON 7710 (Microeconomic Theory 2) I co-authored a short paper that tackled The Tragedy of the Commons game, from the firm's point of view.

To see the theoretical outcome of this game for different industry sizes, I wrote the package "gamepaper" that provides the structure and estimates the payoffs, best responses and equilibriums of each firm for a given industry size. 

To see the empirical outcome of this game for different industry sizes, my research team and I will do an experiment with 10-15 students at our university. Each of the students will be tasked with the role of a firm in this game, were all of them will be asked to provide their responses simulatenously and without cooperation.

To see the original R script (with the functions), R Markdown and LaTeX Appendix (of our paper) derived from this package, please click [here](https://github.com/dayanara846/Industry-Size-Regulation-in-the-Commons) .


## Installation

To install from GitHub:
```
require(devtools)
install_github("dayanara846/gamepaper", dependencies = NA)
```

If you are using Windows, you will need to have a version of Rtools installed that matches your
version of R in order to build packages from source. Rtools can be downloaded from
[here](https://cran.r-project.org/bin/windows/Rtools/).

Specifying `dependencies = NA` in `install_github` will not install packages listed
in `Suggests` in the `DESCRIPTION` file (some of which may be proprietary and unavailable for download).
