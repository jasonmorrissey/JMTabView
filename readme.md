## JMTabView

This is a dark-themed and easy to use tab view created entirely using Core Graphics, so that it is easy to drop-in to your projects and operates smoothly on iOS devices.  The library itself will also be used in Alien Blue's upcoming iOS updates.

## How it looks

Here's what JMTabView looks like:

<img src="http://alienblue.org/github/JMTabView.png" width=477 height=54 />

And on a retina display:

<img src="http://alienblue.org/github/JMTabView-retina.png" width=638 height=120 />

## Usage

A demo project is included in this repository so that you can dive right in.  In brief, to draw the tab view, you can do the following:

`JMTabView * tabView = [[[JMTabView alloc] initWithFrame:frame] autorelease];`

`[tabView setDelegate:self];`

You can then add tab items:

`[tabView addTabItemWithTitle:@"One" icon:[UIImage imageNamed:@"icon1.png"]];`

You can set the `icon:` to `nil` if you prefer to use text only.

By implementing the `tabView:didSelectTabAtIndex:` method, you will receive a callback when the tab selection changes.

## Acknowledgements

This project uses the UIView+Positioning and UIView+Size categories developed by the very talented [Kevin O'Neill](https://github.com/kevinoneill/Useful-Bits).

## License

JMTabView is BSD licensed, so you can freely use it in commercial applications.
