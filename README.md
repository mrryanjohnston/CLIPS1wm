# CLIPSmwm

A minimal
[mwm](https://github.com/lslvr/mwm)-like
X11 window manager implemented in
[CLIPS](https://clipsrules.net/)
using the
[CLIPSX11](https://github.com/mrryanjohnston/CLIPSX11) library.

## Install
1. Install
[`CLIPSX11`](https://github.com/mrryanjohnston/CLIPSX11)
first (version 0.1.0).
2. Then:

```sh
sudo make install
```

## Usage

On my keyboard, `Mod4` is mapped to the Windows Key.

- `Mod4 + e` - Runs [`dmenu`](https://tools.suckless.org/dmenu/)
- `Mod4 + n` - Switches windows
- `Mod4 + q` - Closes currently focused window

## Details

There are three files that provide an example window manager
based on [mwm](https://github.com/lslvr/mwm).
The first file `CLIPSmwm.multifield.clp` takes the output from
X11 functions and returns them as CLIPS Multifields
and asserts implied Facts.
The second file `CLIPSmwm.fact.clp` asserts them directly as CLIPS Facts.
The `deftemplates.clp` file is necessary if you use the `CLIPSmwm.fact.clp` file.
The third file `CLIPSmwm.instance.clp` makes them as CLIPS Instances.
The `defclasses.clp` file is necessary if you use the `CLIPSmwm.instance.clp` file.

### Display Managers

If you want to install this to your machine, use `sudo make install`
to install a `CLIPSX11` to your `/usr/local/bin` dir.
This will also attempt to install the `CLIPSmwm.desktop` file
into your `/usr/share/xsessions` dir.

### Via `startx`

Run `sudo make install` and add this to the end of your `.xinitrc`:

```
exec CLIPSmwm.sh
```
