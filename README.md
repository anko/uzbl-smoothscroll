# uzbl-smoothscroll

Smooth scrolling script for [`uzbl-browser`][uzbl].

## Install

### Plain JS file

    cd "${XDG_CONFIG_HOME:-$HOME/.config}/uzbl/scripts"
    wget "https://github.com/c39/uzbl-smoothscroll/releases/download/v1.0.0/smoothscroll.js"

Or just download it from the [release page][release].

Edit your `config` to load on each page:

    @on_event   LOAD_COMMIT    script @scripts_dir/smoothscroll.js

### Compile from source

You'll need [`npm`][npm], because I'm way too serious about dependency
management. Basically just `git clone` and run `npm install` in the root dir:

    cd "${XDG_CONFIG_HOME:-$HOME/.config}/uzbl/scripts"
    git clone https://github.com/c39/uzbl-smoothscroll smoothscroll
    npm install

Edit your `config` to load it on each page:

    @on_event   LOAD_COMMIT    script @scripts_dir/smoothscroll/bundle.js

## Use

Edit your `config` to bind whatever keys you like:

    # Smooth scroll by absolute amounts
    @cbind  j = js uzbl.scrollPixels("vertical", 50)
    @cbind  k = js uzbl.scrollPixels("vertical", -50)
    @cbind  h = js.uzbl.scrollPixels("horizontal", -50)
    @cbind  l = js.uzbl.scrollPixels("horizontal", 50)

    # Smooth scroll by a percentage of the view
    @cbind  <Ctrl>d = js uzbl.scrollPercent("vertical", 50)
    @cbind  <Ctrl>u = js uzbl.scrollPercent("vertical", -50)
    @cbind  <Ctrl>f = js uzbl.scrollPercent("vertical", 100)
    @cbind  <Ctrl>b = js uzbl.scrollPercent("vertical", -100)

    # Smooth scroll by a percentage of the entire page
    @cbind  gg      = js.uzbl.scrollPercent("vertical", 0)
    @cbind  G       = js.uzbl.scrollPercent("vertical", 100)

## Known bugs

 - Occasionally drifts horizontally a little when scrolling vertically (or vice
   versa). WebKit might be rounding floating point `pageXOffset`/`pageYOffset`
   values?
 - Bigger than it needs to be. I got lazy and included all of D3, because it's
   coming from a local disk anyway and still pretty small compared to any image
   file.


 [npm]: https://www.npmjs.org/ "Node Package Manager"
 [uzbl]: http://www.uzbl.org/
 [release]: https://github.com/c39/uzbl-smoothscroll/releases
