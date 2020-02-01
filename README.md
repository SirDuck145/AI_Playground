# AI_Playground
This project is very much in progress.<br/>
It is all about AI. I hope to learn a ton about designing complex systems.<br/>
Currently I'm working on adding my first AI to the game. This creature will be a bunny.<br/>

## Overview/Roadmap
The world will be randomly generated with grass tiles. (Water tiles will come soon)<br/>
You have a bar at the top, this bar has a selection of creatures... or at least... it will. (Currently one bunny)<br/>
Drag a creature from the bar onto a tile on the map to spawn an instance of that creature.<br/>
Once the creature is added to the world it will search for food, water, and mating.<br/>

## Current Issue
Currently I am working on the first AI.<br/>
My inital design for the bunny AI had bad weights.<br/>
Essentially this caused my bunny to roam while it was not hungry.<br/>
However when the bunny became hungry the AI prioritized tiles closer to itself.<br/>
If the bunny became too hungry, and did not see food in range, it would sit on its own tile<br/>
![Unmoving Bunnies](Screenshots/Bunnies_on_grass.png)

## Lessons Learned So Far
Designing a mathematical equation for my AI's weights needs to be done with care.<br/>
My first attempt I put very little thought into how the weight values were being picked.<br/>
Which... backfired.
