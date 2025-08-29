# CLIPS1wm

A minimal
[1wm](https://github.com/lslvr/1wm)-like
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

To see the "default" implementation of CLIPS1wm,
check out `CLIPS1wm.instance.clp`
which uses COOL (CLIPS Object Oriented Language) Instances
to represent `XEvents`.

There are three files that provide an example window manager
based on [1wm](https://github.com/lslvr/1wm).
The first file `CLIPS1wm.multifield.clp` takes the output from
X11 functions and returns them as CLIPS Multifields
and asserts implied Facts.
The second file `CLIPS1wm.fact.clp` asserts them directly as CLIPS Facts.
The
[`deftemplates.clp`](https://github.com/mrryanjohnston/CLIPSX11/blob/main/deftemplates.clp)
file is necessary if you use the `CLIPS1wm.fact.clp` file.
The third file `CLIPS1wm.instance.clp` makes them as COOL Instances.
The
[`defclasses.clp`](https://github.com/mrryanjohnston/CLIPSX11/blob/main/defclasses.clp)
file is necessary if you use the `CLIPS1wm.instance.clp` file.

### Display Managers

If you want to install this to your machine, use `sudo make install`
to install a `CLIPSX11` to your `/usr/local/bin` dir.
This will also attempt to install the `CLIPS1wm.desktop` file
into your `/usr/share/xsessions` dir.

### Via `startx`

Run `sudo make install` and add this to the end of your `.xinitrc`:

```
exec CLIPS1wm
```
