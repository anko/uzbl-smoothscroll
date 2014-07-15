# uzbl-smoothscroll

Smooth scrolling script for uzbl.

You currently need [`npm`][npm] to compile it, because I'm serious about
dependency management. (Just-a-plain-JS-file [release][gh-release-tut] coming
soon.)

## Install

Get it:

    cd "${XDG_CONFIG_HOME:-$HOME/.config}/uzbl/scripts"
    git clone https://github.com/c39/uzbl-smoothscroll smoothscroll
    npm install

Edit your config:

    # Load the script on each page
    @on_event   LOAD_COMMIT    script @scripts_dir/smoothscroll/bundle.js

    # Smooth scroll by absolute amounts
    @cbind  j = js uzbl.scrollPixels("vertical", 50)
    @cbind  k = js uzbl.scrollPixels("vertical", -50)
    @cbind  J = js uzbl.scrollPixels("vertical", 20)
    @cbind  K = js uzbl.scrollPixels("vertical", -20)
    # Smooth scroll by a percentage of the page
    @cbind  <Ctrl>d = js uzbl.scrollPercent("vertical", 50)
    @cbind  <Ctrl>u = js uzbl.scrollPercent("vertical", -50)
    @cbind  <Ctrl>f = js uzbl.scrollPercent("vertical", 100)
    @cbind  <Ctrl>b = js uzbl.scrollPercent("vertical", -100)

 [npm]: https://www.npmjs.org/ "Node Package Manager"
 [gh-release-tut]: https://github.com/blog/1547-release-your-software
