## Docker Ruby 2.6.0 Toolkit
This repository enables a terminal (inside a container) with ruby environment ready to work.

With this tool you will be able to develop, run, and test ruby/rails applications with out setup ruby/rails in your machine.

### Github credentials ###

In order to be able to clone private repositories using this container you need to copy your **id_ed25519** and **id_ed25519.pub** keys into **keys** directory.

### Commands: ##


* **make help:** run this commantd to show a help for basic options
* **make terminal:** build an image with **ruby 2.6.0**, mounts **src** directory as volume, and launch a terminal to run ruby application in **src** folder
* **make build:** build an image with **ruby 2.6.0**
* **nake version:** builds an image, then launch a container showing the current ruby version.