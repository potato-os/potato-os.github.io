GUI API
=======

The GUI API is designed for creating graphical applications using a fluent builder pattern with the pipeline operator. All widgets support method chaining, making interface construction readable and intuitive.

Quick Example
-------------

.. code-block:: starch

	using gui;
	
	var window = gui.Window();
	window.title("My First App");
	
	gui.Button()
		~> .text("Click me!")
		~> .on_click(handle_click)
		~> window.add_content();
	
	function handle_click() {
		print("Button clicked!");
	}

Window
------

Creates a new OS window for your application.

**Constructor**

.. code-block:: starch

	var window = gui.Window();

**Methods**

``title(text: str)``
	Set the window title.
	
	.. code-block:: starch
	
		window.title("My Application");

``add_content(widget: Widget)``
	Add a widget as the window's content.
	
	.. code-block:: starch
	
		var button = gui.Button().text("Hello");
		window.add_content(button);

Base Widget
-----------

All GUI widgets inherit from ``Widget``, which provides common layout and positioning methods. Every method returns ``self`` for chaining.

Layout Methods
^^^^^^^^^^^^^^

``fill()``
	Fill the entire parent container.
	
	.. code-block:: starch
	
		widget.fill();

``expand(expand: bool)``
	Expand to fill available space in parent container.
	
	.. code-block:: starch
	
		widget.expand(true);

``width(width: int)``
	Set fixed width in pixels.
	
	.. code-block:: starch
	
		widget.width(200);

``height(height: int)``
	Set fixed height in pixels.
	
	.. code-block:: starch
	
		widget.height(100);

``margin_all(margin: float)``
	Set margin on all sides.
	
	.. code-block:: starch
	
		widget.margin_all(10);

Positioning Methods
^^^^^^^^^^^^^^^^^^^

``dock(side: int)``
	Dock the widget to a side of the parent. Values: ``0`` (top), ``1`` (left), ``2`` (bottom), ``3`` (right).
	
	.. code-block:: starch
	
		widget.dock(0);  // Dock to top

``anchor_left(anchor: float)``
	Set left anchor point (0.0 to 1.0).

``anchor_right(anchor: float)``
	Set right anchor point (0.0 to 1.0).

``anchor_top(anchor: float)``
	Set top anchor point (0.0 to 1.0).

``anchor_bottom(anchor: float)``
	Set bottom anchor point (0.0 to 1.0).

Hierarchy Methods
^^^^^^^^^^^^^^^^^

``add(child: Widget)``
	Add a child widget.
	
	.. code-block:: starch
	
		container.add(child_widget);

``remove(child: Widget)``
	Remove a child widget.

``get_parent()``
	Returns the parent widget.

``delete()``
	Remove this widget from the tree.

Query Methods
^^^^^^^^^^^^^

``get_size()``
	Returns the widget's size as a dictionary with ``x`` and ``y`` keys.

``get_position()``
	Returns the widget's position as a dictionary with ``x`` and ``y`` keys.

Text
----

Display formatted text using BBCode-style markup.

**Constructor**

.. code-block:: starch

	var text = gui.Text();

**Methods**

``text(text: str)``
	Set the displayed text. Supports BBCode formatting tags like ``[b]``, ``[i]``, ``[color=red]``, etc.
	
	.. code-block:: starch
	
		gui.Text()
			~> .text("[b]Bold[/b] and [i]italic[/i] text")
			~> .fill();

``align(horizontal: int, vertical: int)``
	Set text alignment. Horizontal: ``0`` (left), ``1`` (centre), ``2`` (right). Vertical: ``0`` (top), ``1`` (centre), ``2`` (bottom).
	
	.. code-block:: starch
	
		text.align(1, 1);  // Centre both ways

**Example**

.. code-block:: starch

	gui.Text()
		~> .text("[color=blue]Welcome to PotatoOS[/color]")
		~> .align(1, 0)
		~> .height(50)
		~> window.add_content();

Button
------

Interactive button widget with click handling.

**Constructor**

.. code-block:: starch

	var button = gui.Button();

**Methods**

``text(text: str)``
	Set button text.

``image(image: Image)``
	Set button icon from an image.

``flat(flat: bool)``
	Enable or disable flat style (no background).
	
	.. code-block:: starch
	
		button.flat(true);

``colour(colour: Colour)``
	Set text colour.
	
	.. code-block:: starch
	
		button.colour(Colour.RED);

``font_size(size: int)``
	Set font size in pixels.

``font(path: str)``
	Load a custom font from a file path.

``on_click(callback: function)``
	Register a callback function to run when clicked. The callback receives no arguments.
	
	.. code-block:: starch
	
		function handle_click() {
			print("Clicked!");
		}
		
		button.on_click(handle_click);

**Example**

.. code-block:: starch

	gui.Button()
		~> .text("Submit")
		~> .colour(Colour.WHITE)
		~> .font_size(16)
		~> .on_click(submit_form)
		~> .width(100)
		~> .height(40);

ColourRect
----------

A simple coloured rectangle, useful for backgrounds and debugging.

**Constructor**

.. code-block:: starch

	var rect = gui.ColourRect();

**Methods**

``colour(colour: Colour)``
	Set the rectangle colour.
	
	.. code-block:: starch
	
		rect.colour(Colour.RED);

``random()``
	Set a random colour. Useful for debugging layouts.
	
	.. code-block:: starch
	
		rect.random();

**Example**

.. code-block:: starch

	gui.ColourRect()
		~> .colour(Colour.from_hex("#FF5733"))
		~> .width(200)
		~> .height(200);

Container
---------

A basic container widget that holds child widgets. Use ``FlexBox`` or ``Grid`` for automatic layout.

**Constructor**

.. code-block:: starch

	var container = gui.Container();

**Methods**

Uses all base ``Widget`` methods, plus ``add()`` and ``remove()`` for managing children.

**Example**

.. code-block:: starch

	var container = gui.Container();
	container.fill();
	
	container.add(gui.Text().text("Child 1"));
	container.add(gui.Text().text("Child 2"));

FlexBox
-------

A flexible box layout container that arranges children in a row or column.

**Constructor**

.. code-block:: starch

	var flexbox = gui.FlexBox();

**Methods**

``direction(direction: str)``
	Set layout direction. Values: ``"horizontal"`` or ``"vertical"``.
	
	.. code-block:: starch
	
		flexbox.direction("vertical");

``gap(gap: int)``
	Set spacing between children in pixels.
	
	.. code-block:: starch
	
		flexbox.gap(10);

``align(alignment: str)``
	Set child alignment. Values: ``"begin"``, ``"center"``, ``"end"``.
	
	.. code-block:: starch
	
		flexbox.align("center");

**Example**

.. code-block:: starch

	var flexbox = gui.FlexBox();
	flexbox
		~> .direction("horizontal")
		~> .gap(20)
		~> .align("center")
		~> .fill();
	
	for i in [1..3] {
		flexbox.add(gui.Button().text("Button " ~ i));
	}

Grid
----

A grid layout container that arranges children in rows and columns.

**Constructor**

.. code-block:: starch

	var grid = gui.Grid();

**Methods**

``columns(columns: int)``
	Set number of columns. Children wrap to new rows automatically.
	
	.. code-block:: starch
	
		grid.columns(3);

``gap_h(gap: int)``
	Set horizontal spacing between columns in pixels.

``gap_v(gap: int)``
	Set vertical spacing between rows in pixels.

**Example**

.. code-block:: starch

	var grid = gui.Grid();
	grid
		~> .fill()
		~> .columns(3)
		~> .gap_h(10)
		~> .gap_v(10);
	
	for i in [1..9] {
		grid.add(gui.ColourRect().random().expand(true));
	}

Scroll
------

A scrollable container with optional scrollbars.

**Constructor**

.. code-block:: starch

	var scroll = gui.Scroll();

**Methods**

``scrollbars(horizontal: str, vertical: str)``
	Set scrollbar visibility. Values: ``"disabled"``, ``"auto"``, ``"always"``, ``"never"``. 
	
	If called with no arguments, returns current scrollbar state as a dictionary with ``x`` and ``y`` keys.
	
	.. code-block:: starch
	
		scroll.scrollbars("auto", "always");
		
		var state = scroll.scrollbars();
		print(state.x);  // Current horizontal mode

``position(horizontal: int, vertical: int)``
	Set scroll position in pixels.
	
	If called with no arguments, returns current scroll position as a dictionary with ``x`` and ``y`` keys.
	
	.. code-block:: starch
	
		scroll.position(0, 100);  // Scroll down 100px
		
		var pos = scroll.position();
		print(pos.y);  // Current vertical scroll

**Example**

.. code-block:: starch

	var scroll = gui.Scroll();
	scroll
		~> .fill()
		~> .scrollbars("auto", "always");
	
	var content = gui.FlexBox().direction("vertical");
	for i in [1..50] {
		content.add(gui.Text().text("Line " ~ i));
	}
	scroll.add(content);

Input
-----

Single-line text input field.

**Constructor**

.. code-block:: starch

	var input = gui.Input();

**Methods**

``text(text: str)``
	Set the current text value.

``get_text()``
	Returns the current text value as a string.
	
	.. code-block:: starch
	
		var value = input.get_text();

``placeholder(text: str)``
	Set placeholder text shown when empty.
	
	.. code-block:: starch
	
		input.placeholder("Enter your name...");

``secret(character: str)``
	Enable password mode with custom masking character. Pass empty string to disable.
	
	.. code-block:: starch
	
		input.secret("*");  // Enable
		input.secret("");   // Disable

``editable(editable: bool)``
	Enable or disable editing.

``max_length(length: int)``
	Set maximum character limit.

``change(callback: function)``
	Register callback called when text changes. Receives the new text as argument.
	
	.. code-block:: starch
	
		function on_change(new_text: str) {
			print("Text changed to: " ~ new_text);
		}
		
		input.change(on_change);

``submit(callback: function)``
	Register callback called when Enter is pressed. Receives the text as argument.
	
	.. code-block:: starch
	
		function on_submit(text: str) {
			print("Submitted: " ~ text);
		}
		
		input.submit(on_submit);

**Example**

.. code-block:: starch

	function validate_input(text: str) {
		if text.length() < 3 {
			print("Too short!");
		}
	}
	
	gui.Input()
		~> .placeholder("Username")
		~> .max_length(20)
		~> .change(validate_input)
		~> .fill();

Editor
------

Multi-line text editor with word wrapping options.

**Constructor**

.. code-block:: starch

	var editor = gui.Editor();

**Methods**

``text(text: str)``
	Set the current text content.

``get_text()``
	Returns the current text content as a string.

``placeholder(text: str)``
	Set placeholder text shown when empty.

``editable(editable: bool)``
	Enable or disable editing.

``change(callback: function)``
	Register callback called when text changes. Receives the full text as argument.
	
	.. code-block:: starch
	
		function on_change(text: str) {
			print("Content updated");
		}
		
		editor.change(on_change);

**Word Wrapping**

``wrap_arbitrary()``
	Wrap at any character position.

``wrap_word()``
	Wrap at word boundaries.

``wrap_word_smart()``
	Intelligent word wrapping (recommended).

``wrap_off()``
	Disable word wrapping.

**Example**

.. code-block:: starch

	var editor = gui.Editor();
	editor
		~> .placeholder("Enter your code here...")
		~> .wrap_word_smart()
		~> .change(save_content)
		~> .fill();

Image
-----

Display images with various scaling modes.

**Constructor**

.. code-block:: starch

	var image = gui.Image();

**Methods**

``source(image: Image)``
	Set the image to display from an Image object.
	
	.. code-block:: starch
		
		using graphics;
		var img = graphics.Image("/users/john/cat.png");
		image.source(img);

**Scaling Modes**

``scale()``
	Scale to fill the entire widget area (may distort aspect ratio).

``tile()``
	Tile the image to fill the area.

``actual_size()``
	Display at original size (no scaling).

``keep_aspect()``
	Scale to fit while maintaining aspect ratio.

**Example**

.. code-block:: starch

	gui.Image()
		~> .source(graphics.load_image("/system/assets/logo.png"))
		~> .keep_aspect()
		~> .width(200)
		~> .height(200);