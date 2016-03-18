var s7d_colours = {
  'base03': '#002b36',
  'base02': '#073642',
  'base01': '#4f646b', //'#586e75',
  'base00': '#657b83',
  'base0': '#839496',
  'base1': '#93a1a1',
  'base2': '#eee8d5',
  'base3': '#faf5e8', //'#fdf6e3',
  'yellow': '#b58900',
  'orange': '#cb4b16',
  'red': '#dc322f',
  'magenta': '#d33682',
  'violet': '#6c71c4',
  'blue': '#268bd2',
  'cyan': '#2aa198',
  'green': '#859900'
};

// Solarized Light
term_.prefs_.set('background-color', s7d_colours.base3);
term_.prefs_.set('foreground-color', s7d_colours.base01);
term_.prefs_.set('cursor-color', 'rgba(0, 0, 0, 0.2)');
term_.prefs_.set('color-palette-overrides', [
  s7d_colours.base2, s7d_colours.red, s7d_colours.green, s7d_colours.yellow, s7d_colours.blue,
  s7d_colours.magneta, s7d_colours.cyan, s7d_colours.base2, s7d_colours.base03, s7d_colours.orange,
  s7d_colours.base00, s7d_colours.base01, s7d_colours.magenta, s7d_colours.violet, s7d_colours.base0,
  s7d_colours.base3, s7d_colours.base1, s7d_colours.base02]);

// disable scrollbar (can still scroll)
term_.prefs_.set('scrollbar-visible', false)

 // Disable bold
term_.prefs_.set('enable-bold', false);

// Chose a font
term_.prefs_.set('user-css', 'http://fonts.googleapis.com/css?family=Droid+Sans+Mono');
term_.prefs_.set('font-family', '"Droid Sans Mono", monospace');
term_.prefs_.set('font-size', 16.7)
