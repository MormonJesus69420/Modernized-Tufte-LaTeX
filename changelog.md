# Changelog

## 4.0.0 - RELEASE PENDING
- Consolidate changes by [Chris K. Grant](https://github.com/chriskgrant) and
  [Matthew Y. He](https://github.com/mattyizhengHe).
- Added custom colors to `tufte-common.def`.
- Added some styling to section and paragraph titles in the handout class only.
  - Section and subsection titles have now a colored box with section number.
  - All titles are now colored.
  - Section styling resides `tufte-handout.cls`.
  - Section styling can be disabled with the `nomoderntitles` option.
- Added `shadednote` and `framednote` environments to the both classes.
  - Used to emphasize notes in the documents
  - Note environments are defined and styled in `tufte-common.def`.
  - Note environments can be disabled with the `nonotes` option.
    - This will also prevent loading `cleveref`, `amsthm`, and `thmtools` pkgs.
- `sfsidenotes` option now **only** sets marginals to use sans serif font,
  previously it also set abstract and titles in handouts to sans serif font.
  - Renamed `sfsidenotes` to `sfmarginals` for better clarity.
- Added `sftitle` and `nosftitle` to set titles in sans or serif font.
  - For compatibility `sftitle` is false in handouts & true in books.
  - These options also defines the abstract font in handouts as sans or serif.
  - These options also defines the epigraph font in books as sans or serif.
- Added `blankpagetext` command to set the text on blank pages.
  - By default it is empty, but can be redefined to any text.
  - Example in the sample book sets it as such:
    ```latex
    \renewcommand*{\blankpagetext}{
      This page intentionally contains only this sentence.
    }
    ```
- Added extra features to the makefile.
  - makefile ignores customization files when compiling.
  - `make all` default make command compiles sample documents with every engine.
  - `make compile-X` compiles sample documents, but avoids customization files.
  - `make compile-only` compiles only a file specified in FILE env variable.
  - `make clean-all` to remove all auxiliary and output files.
  - `make install` to install the classes to the local texmf tree.
  - `make uninstall` to remove the installed classes from the local texmf tree.
  - `make update` to update the installed classes.
- Changed monospaced font to `Fira Code` in the sample documents.
  - Added setting to `custom-tufte-common.tex` to use `Recursive` fonts instead.
  - This setting mostly showcases the capability to change the monospaced font.
- Cleaned up code formatting/style and standardized filenames/structure.
- Expanded the documentation.

## 3.6.0 - 2023/03/20
Changes made by [Chris K. Grant](https://github.com/chriskgrant)

- Clean up code formatting/style.
- Use iftex package to determine which TeX engine is running.
- Fix handling of fonts and letterspacing under LuaLaTeX and XeLaTeX
  (necessary to get the class to work with LuaLaTeX).
- Substitute biblatex and biber for natbib/bibtex for making bibliographies;
  this breaks the optional vertical offset argument of the re-defined `\cite`
  command, as biblatex also uses multiple optional arguments to `\cite`.
- Add a Makefile for easy testing and installation of the classes.
- Use ETbb as the default typeface if `etbb` package is installed.

## 3.5.2 - 2015/06/21

- A variety of bug fixes and small improvements.

## 3.5.1 - 2010/03/28

-  Added bibliography style that didn't make it into the initial release.

## 3.5.0 - 2009/12/11

- Added a [nohyper] document class option that suppresses loading of the
  hyperref package.
- Added three commands to modify the positioning of the captions.
- Now automatically recalculates the lengths in case you've modified the page
  size or margins.
- Added a B5 paper size.
- The justification of sidenotes, margin notes, captions, and citations can be
  set individually now.
- The font and style of sidenotes, margin notes, captions, and citations can
  now be set individually.
- The \caption command now accepts an optional vertical offset argument.
- Added the \morefloats command that works in the same way the morefloats
  package does.
- Fixed a number of bugs.

## 3.0.0 - 2009/05/17

- Created a Tufte-book document class.
- Added optional offset parameter to sidenotes, cite, etc. so their vertical
  position can be adjusted manually.
- Added support for the `bidi' package with XeLateX.
- Adjusted font sizes and spacing to more closely reflect those used in
  Tufte's books.
- Captions are now typeset in the margin as in Tufte's books.

## 2.0.1 - 2008/11/16

- Now works with footmisc version > 5.4.

## 2.0.0 - 2008/06/06

- Added `sfsidenotes' option to set the sidenotes and captions in the sans
  serif font.
- Use the Palatino fonts if they're installed.
- Created `marginfig' and `margintab' environments.
- Added running heads.
- Fixed the alignment of sidenote numbers.
- Added \section and \subsection headings.
- Uses the Bera Mono fonts if they're installed.
- Added `symmetric' option to produce outside-margin sidenotes in two-sided
  spreads.
- Added `justified' option to set the text fully justified.
- Rewrote sample-handout to illustrate the tufte-handout usage and serve as an
  example of its features.

## 1.2.3 - 2008/02/11

- To remove References section from sample-handout.
- Updated README.txt

## 1.2.2 - 2008/02/09

- Use footmisc package to set \footnotes as sidenotes
- Use natbib package to set bibliography entries as sidenotes

## 1.2.1 - 2007/10/21

- To assure existing \footnotes become \sidenotes

## 1.2.0 - 2007/10/20

- Enhancements
  - Added a4paper option (Kevin Godby)
  - Have \margin{note,figure,table} use \@tufteh@marginfont
- Bug fix
  - \@tufteh@overhang typo in figure*, table*, and fullwidth environments
    (Kevin Godby)

## 1.1.0 - 2007/10/18

- To add some missing environments and commands:
  - sidenote
  - marginnote (no mark)
  - marginfigure/table
  - text-width figure/table (figure/table)
  - page-width figure/table (figure*/table*)
  - page-width environment (for custom minipage displays)
- To namespace raggedright
- To add margin font hook

## 1.0.1 - 2007/09/24

- To correct README instructions.

## 1.0.0 - 2007/09/24

- First public release

## 0.1.0 - 2004/02/04

- Birthday!