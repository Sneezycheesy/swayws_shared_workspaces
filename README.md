<h1>Share workspaces between monitors in Sway</h1>
<p>
  Do you hate Wayland?<br/>
  ... <br/>
  Do you hate Sway?<br/>
  ...
</p>
<h3>So did I!</h3>
<p>
  I love how XMonad handles workspaces, it switches workspaces between displays when they are both on a display at that time.<br/>
  Sway is not able to do this out of the box, so I wrote a script to help with this.
</p>

<h4>More context</h4>
<p>
  Imagine you have two monitors. <br/>
  Workspace 1 (ws1) is on the left (display 1)<br/>
  Workspace 2 (ws2) is on the right (display 2)<br/>
  <br/>
  You are working on display 1 but would like to grab workspace 2.<br/>
  XMonad will switch the two workspaces for you; ws1 goes to display 2, ws2 comes to display 1.<br/>
  <br/>
  Handy, right? That's what this script is for!
</p>

<h4>Prerequisites</h4>
Make sure you have 
<ul>
  <li><b>jq</b></li>
  <li>
    <a href="https://lib.rs/install/swayws">Swayws</a>
    <ul>
      <li>Depends on <a href="https://www.rust-lang.org/tools/install">Rust</a>
    </ul>
  </li>
</ul>


<p>Found a bug? Let me know!</p>
