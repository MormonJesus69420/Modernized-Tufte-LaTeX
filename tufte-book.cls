%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  This file sets up Tufte-LaTeX Book  %%%%%%%%%%%%%%%%%%%%%
%  Written by original Tufte-LaTeX team, modified by Daniel Aaron Salwerowicz  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%  Header and basic setup  %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Declare this as a tufte-book class
% Define needed TeX format and minimum version
\NeedsTeXFormat{LaTeX2e}[1994-06-01]
% Define what class this document provides as well as the version
\ProvidesClass{tufte-book}[2025-03-01 v4.0.0 Tufte-Book Class]
% The base LaTeX class (defaults to the book style)
\newcommand{\@tufte@class}{book}
% The name of the package (defaults to tufte-book)
\newcommand{\@tufte@pkgname}{tufte-book}
% Load the common style elements from main tufte-common.def file
\input{tufte-common.def}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  Front, main, and back matter setup  %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% The front matter in Tufte's /Beautiful Evidence/ contains everything up to the
% opening page of Chapter 1 
% The running heads, when they appear, contain only the (arabic) page numbers in
% the outside corner
% The front matter includes the title page, copyright page, dedication, table of
% contents, list of figures, list of tables, etc.
% This tries to replicate that style as closely as possible
\renewcommand\frontmatter{%
  % Clear one or two pages before the frontmatter depending on openright option
  \if@openright%
    \cleardoublepage%
  \else%
    \clearpage%
  \fi%
  % Signify that this /isn't/ the main matter
  \@mainmatterfalse%
  % Set page numbering style to arabic
  \pagenumbering{arabic}%
  % Set the page style to plain
  \pagestyle{plain}%
  % Clear the header and footer fields
  \fancyhf{}%
  % Set the header and footer fields to display the page number in the outside
  % corner, left or right depending on whether it's a two-sided or one-sided
  \ifthenelse{\boolean{@tufte@twoside}}{%
    \fancyhead[LE,RO]{\thepage}
  }{%
    \fancyhead[RE,RO]{\thepage}
  }%
}

% The main matter in Tufte's /Beautiful Evidence/ doesn't restart the page
% numbering, it continues where it left off in the front matter
% That's being handled in this section, fixing it for both one sided and two
% sided versions
\renewcommand\mainmatter{%
  % Clear one or two pages before the mainmatter depending on openright option
  \if@openright% 
    \cleardoublepage%
  \else%
    \clearpage%
  \fi%
  % Signify that this /is/ the main matter
  \@mainmattertrue%
  % Clear the header and footer fields
  \fancyhf{}%
  % Set the header and footer fields to display chapter/book title and page
  % number in the outside corners.
  \ifthenelse{\boolean{@tufte@twoside}}{%
    % Two-sided book
    \renewcommand{\chaptermark}[1]{\markboth{##1}{}}%
    %   Book title with page number on the left side
    \fancyhead[LE]{\thepage\quad\smallcaps{\newlinetospace{\plaintitle}}}%
    %   Chapter title with page number on the right side
    \fancyhead[RO]{\smallcaps{\newlinetospace{\leftmark}}\quad\thepage}%
  }{%
    % One-side
    %   Book title with page number on the right side
    \fancyhead[RE,RO]{\smallcaps{\newlinetospace{\plaintitle}}\quad\thepage}%
  }%
}

% The back matter contains appendices, indices, glossaries, endnotes,
% bibliographies, list of contributors, illustration credits, etc.
% This simply clears one or two pages before the backmatter depending on the
% openright option.
\renewcommand\backmatter{%
  \if@openright%
    \cleardoublepage%
  \else%
    \clearpage%
  \fi%
  \@mainmatterfalse%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%  Table of content setup  %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Only show the chapter titles in the table of contents
\setcounter{tocdepth}{0}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%  Load user's customization file if present %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% If there is a `custom-tufte-book.tex' file, load it
% This file contains user's common customization for all tufte-book classes
\IfFileExists{custom-tufte-book-.tex}{%
  \input{custom-tufte-book.tex}%
  \@tufte@info@noline{Loading custom-tufte-book.tex}%
  }{}

\endinput

