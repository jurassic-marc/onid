# ![Last commit](https://img.shields.io/github/last-commit/jurassic-marc/onid?style=for-the-badge)  ![License](https://img.shields.io/badge/License-Custom-orange?style=for-the-badge)

![kdb+/q version](https://img.shields.io/badge/kdb+-v3.6-lightgrey?style=for-the-badge&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAYCAMAAABDT2Q4AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA%2Bf8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAMAUExURUxpcRxttRxttRxttRxttRxttRxttRxttRxttRxttRxttRxttRxttRxttRxttRxttRxttRERERISEhMTExQUFBUVFRYWFhcXFxgYGBkZGRoaGhsbGxwcHB0dHR4eHh8fHyAgICEhISIiIiMjIyQkJCUlJSYmJicnJygoKCkpKSoqKisrKywsLC0tLS4uLi8vLzAwMDExMTIyMjMzMzQ0NDU1NTY2Njc3Nzg4ODk5OTo6Ojs7Ozw8PD09PT4%2BPj8%2FP0BAQEFBQUJCQkNDQ0REREVFRUZGRkdHR0hISElJSUpKSktLS0xMTE1NTU5OTk9PT1BQUFFRUVJSUlNTU1RUVFVVVVZWVldXV1hYWFlZWVpaWltbW1xcXF1dXV5eXl9fX2BgYGFhYWJiYmNjY2RkZGVlZWZmZmdnZ2hoaGlpaWpqamtra2xsbG1tbW5ubm9vb3BwcHFxcXJycnNzc3R0dHV1dXZ2dnd3d3h4eHl5eXp6ent7e3x8fH19fX5%2Bfn9%2Ff4CAgIGBgYKCgoODg4SEhIWFhYaGhoeHh4iIiImJiYqKiouLi4yMjI2NjY6Ojo%2BPj5CQkJGRkZKSkpOTk5SUlJWVlZaWlpeXl5iYmJmZmZqampubm5ycnJ2dnZ6enp%2Bfn6CgoKGhoaKioqOjo6SkpKWlpaampqenp6ioqKmpqaqqqqurq6ysrK2tra6urq%2Bvr7CwsLGxsbKysrOzs7S0tLW1tba2tre3t7i4uLm5ubq6uru7u7y8vL29vb6%2Bvr%2B%2Fv8DAwMHBwcLCwsPDw8TExMXFxcbGxsfHx8jIyMnJycrKysvLy8zMzM3Nzc7Ozs%2FPz9DQ0NHR0dLS0tPT09TU1NXV1dbW1tfX19jY2NnZ2dra2tvb29zc3N3d3d7e3t%2Ff3%2BDg4OHh4eLi4uPj4%2BTk5OXl5ebm5ufn5%2Bjo6Onp6erq6uvr6%2Bzs7O3t7e7u7u%2Fv7%2FDw8PHx8fLy8vPz8%2FT09PX19fb29vf39%2Fj4%2BPn5%2Bfr6%2Bvv7%2B%2Fz8%2FP39%2Ff7%2B%2Fv%2F%2F%2FycCyLQAAAABdFJOUwBA5thmAAAAZ0lEQVR42tSSwQqAMAxDA8oOIpj%2F%2F1ovMrJmM3i0l9H0sXbpgBwkyX8R7CEFzgkOAAaSvSC3FaVprnNw1kyJ0yaUF5qAVU4U5TLiKAjwrcsWJ0UmkPyAue2uP%2Bf%2BsrkWd7v%2BHynuAQAJJBdpvuU1PgAAAABJRU5ErkJggg%3D%3D)  ![Python version](https://img.shields.io/badge/Python-v2.7-lightgrey?style=for-the-badge&logo=python )  ![Flask version](https://img.shields.io/badge/Flask-v1.1.2-lightgrey?style=for-the-badge&logo=flask)  ![PyQ version](https://img.shields.io/badge/PyQ-v4.2.1-lightgrey?style=for-the-badge&logo=python)

# Sudoku Solver Using a Backtracking Algorithm

This is a Ulster University, BSc Computing Science final year project which solves 9x9 Sudoku puzzles.

The dissertation submitted with this code base is found in `./report/dissertation.pdf`
<br>

### Disclaimer

> This project was developed using:
> + `python v2.7`
> + `python modules version` as described in `./py/requirements.txt`
> + `q v3.6`
> + `rlwrap`
> + `ES6`
> + `HTML5`
> + `CSS3`

> *Software versions are subject to change with new releases, to ensure the project runs smoothly without alteration the above versions should be used.*
> *This software was last ran on 16/04/2019.*

<br>

## Introduction

_The application currently solves 94.5% of valid puzzles suppled to it._

<br>

This application allows users to [play 9x9 Sudoku puzzles](#playing-sudoku) through its front-end website. However, its main feature is its ability to [solve and check solutions](#solving-sudoku) through its back-end algorithm engine.

#### Playing Sudoku

This application allows users to play and complete 9x9 Sudoku puzzles through its website; it can source puzzles with 3 varying difficulties: easy, medium and hard, or the user can manually enter puzzles.

The user can then enter numbers into the cells using mouse clicks or keyboard presses; the method of entry  can be changed at will. It supports removing and overwriting values in cells except the starting clues which are immutable.

The website is hosted via a python Flask server.
<br>

#### Solving Sudoku

The application attempts to solve the board in its current state (i.e. the starting clues plus user values added) and returns the first solution it finds (this is a prerequisite to a *true* Sudoku puzzle, i.e. a true Sudoku puzzle will only have 1 solution). It also displays the solved board in a new tab to allow it to be printed out.

Invalid boards (i.e. those with *no solution*) are returned to the user via a message stating so.

The back-end solving algorithm engine is developed in the functional programming language q and uses a brute-force backtracking algorithm.

<br>

## Getting Started

Follow the instructions below to enable you to use the application to play and solve 9x9 Sudoku puzzles.

### Prerequisites

The following packages need to be installed before using this application:

##### q
___
1. Complete this [form](https://kx.com/download/) to download q
2. Follow the instructions when prompted during download
3. Unzip the downloaded folder into home by running `unzip /path/to/download/file.zip -d /path/to/home/folder/`
4. Check the installation by running `/path/to/home/folder/q/l32/q`
<br>

##### rlwrap
___
1. Run this command `sudo apt-get install rlwrap`
2. Check the installation by running `rlwrap -v`
<br>

##### log4q
___
1. Git clone the log4q repo by running ` git clone <HTTPS URL>/log4q.git /path/to/log4q/repo/`
<br>

### Installation

To install this application on your local machine, follow these instructions:

1. Create a project directory
```

mkdir proj/

```

2. Clone this repo to your local machine
```

git clone <HTTPS URL>/onid.git /path/to/repo/proj/

```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.5. **Optional**: Create a python virtual environment
```

python -m virtualenv .

```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*then*
```

. bin/activate

```

3. Install the required python libraries
```

pip install -r ./onid/py/requirements.txt

```
<br>

### Configuration

To configure this application follow these steps:
<br>

##### Configure the q server
___
1. In `./q/bin/launch.sh` change the placeholder paths to your specific files
```

home_path='/path/to/home/folder/'
src_path=$home_path'/path/to/repo/proj/onid/q/src/'

```
<br>

##### Configure the Flask server
___
1. In `~/.bashrc` add an environment variable for the entry point to the Flask application and source it
```

export FLASK_APP=/path/to/repo/proj/onid/py/src/src.py

```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*then*
```

. ~/.bashrc

```
<br>

##### Configure logging
___
In `./q/src/init.q` and `./q/test/test.q` change the placeholder path to your specific log4q file
```

\l /path/to/log4q/repo/log4q.q

```
<br>

## Operation

To run this application *both* the front-end Flask server and the back-end q server must be running.

> Note: the [q server](#bring-up-the-q-server) and [Flask server](#bring-up-the-flask-server) run in the foreground so 2 terminal tabs are required.

<br>

#### Bring up the q server
___

1. Change into the q folder
```

cd ./q

```
2. Launch the server
```

sh ./bin/launch.sh

```
<br>


#### Bring up the Flask server
___
1. Change into the py folder
```

cd ./py

```
2. Launch the server
```

sh ./bin/launch.sh

```

## Author

[Marc Templeton](https://github.com/jurassic-marc)

## License

This project is a proof of concept piece and all rights are reserved by the authors of the included software or otherwise - see the [LICENSE.md](LICENSE.md) file for details.
