Markdown

Editor

[Edit on GitHub](https://github.com/requarks/wiki-docs/blob/master/editors/markdown.md)

------

PAGE CONTENTS



Overview



User Guide



Blockquotes



Bold



Code Blocks



Content Tabs



Emojis



Footnotes



Headers



Horizontal Line



Images



Inline Code



Italic



Keyboard Keys



Links



Mermaid Diagrams



Ordered Lists



PlantUML Diagrams



Strikethrough



Subscript



Superscript



Table



Task Lists



Unordered Lists

TAGS

[editors](https://docs.requarks.io/t/editors)

LAST EDITED BY

Administrator

02/06/2023

# Overview

Markdown is a lightweight markup language with plain text formatting syntax. It's the de-facto syntax for writing documentation on major code repositories such as GitHub.

Wiki.js supports the full [CommonMark specification](https://spec.commonmark.org/) + adds some useful extensions (including the Github Flavored Markdown addons).

# User Guide

## Blockquotes

- Usage
- Shortcuts
- Examples
- Stylings

Using a **greater-than** symbol, followed by a space, before each line of text.

## Bold

- Usage
- Shortcuts
- Examples

Using **double asterisks** symbols before and after the text selection.

## Code Blocks

- Usage
- Shortcuts
- Examples
- Syntax Highlighting

Using **triple backticks** symbols before and after the text selection, on dedicated lines.

## Content Tabs

- Usage
- Examples

> This feature is only available from version 2.4 and up.

Using headers and adding the `{.tabset}` class to the parent header. The parent header text will not be shown in the final result.

Note that you can use any header level, as long as the children headers are one level higher. For example, if a parent header is `###` *(h3)*, the tabs headers must be `####` *(h4)*. The maximum header level for a parent being 5 and the children 6.

## Emojis

- Usage
- Examples

Using the syntax `:identifier:`

See the [Emoji Cheat Sheet](https://www.webfx.com/tools/emoji-cheat-sheet/) for the full list of possible options.

## Footnotes

- Usage
- Examples

Use the syntax `[^1]` for the location of the footnote in the main text, and `[^1]: this is a footnote` for the actual footnote. Footnotes themselves will automatically appear at the bottom of the page under a horizontal line.

## Headers

- Usage
- Shortcuts
- Examples

Using between 1 and 6 **hashtag** symbol(s), followed by a space, before the text selection.

## Horizontal Line

- Usage
- Shortcuts
- Examples

Using **triple dash** symbols on a dedicated line.

## Images

- Usage
- Shortcuts
- Examples
- Dimensions

Using the syntax `![Image alt text](Image source "Image title")`.

Image alt text - text that is displayed when the image could not be loaded
Image source - file path of image
Image title - is displayed when the user hovers over the picture

## Inline Code

- Usage
- Shortcuts
- Examples

Using a **backtick** symbol before and after the text selection.

## Italic

- Usage
- Shortcuts
- Examples

Using a **single asterisk** symbol before and after the text selection.

## Keyboard Keys

- Usage
- Shortcuts
- Examples

Using `<kbd>` before and `</kbd>` after the text selection.

## Links

- Usage
- Shortcuts
- Examples

Using the syntax `[Link Text](Link Target)`.

## Mermaid Diagrams

- Usage
- Examples

Using a code block with the language **mermaid**.

Refer to [Mermaid website](https://mermaid-js.github.io/mermaid) for the language reference.

## Ordered Lists

- Usage
- Shortcuts
- Examples

Using an **number**, followed by a **dot** symbol, followed by a space, before each line of text.

## PlantUML Diagrams

- Usage
- Examples

Using a code block with the language **plantuml**.

Refer to [PlantUML website](https://plantuml.com/) for the language reference.

## Strikethrough

- Usage
- Shortcuts
- Examples

Using **double tildes** symbols before and after the text selection.

## Subscript

- Usage
- Shortcuts
- Examples

Using a **single tilde** symbol before and after the text selection.

## Superscript

- Usage
- Shortcuts
- Examples

Using a **single caret** symbol before and after the text selection.

## Table

- Usage
- Examples
- Stylings

Using the syntax:

```md
| Header A1 | Header B1 | Header C1 |
|-----------|-----------|-----------|
| Cell A2   | Cell B2   | Cell C2   |
| Cell A3   | Cell B3   | Cell C3   |
...
```

Copy

## Task Lists

- Usage
- Examples

Using the syntax `- [ ]` or a `- [x]`.

## Unordered Lists

- Usage
- Shortcuts
- Examples
- Stylings

Using an **asterisk** or a **dash** symbol, followed by a space, before each line of text.