%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  This file sets up Tufte-LaTeX Book  %%%%%%%%%%%%%%%%%%%%%
%  Written by original Tufte-LaTeX team, modified by Daniel Aaron Salwerowicz  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%  Header and basic setup  %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Declare this as a tufte-handout class
% Define needed TeX format and version
\NeedsTeXFormat{LaTeX2e}[1994-06-01]
% Define what class this document provides as well as the version
\ProvidesClass{tufte-handout}[2025-03-01 v4.0.0 Tufte-Handout Class]
% The base LaTeX class (defaults to the article style)
\newcommand{\@tufte@class}{article}
% The name of the package (defaults to tufte-handout)
\newcommand{\@tufte@pkgname}{tufte-handout}
% Load the common style elements from main tufte-common.def file
\input{tufte-common.def}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Require packages  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Require needed packages for the tufte-handout class
% The `thmtools' package is required for the Note environments
%   This package requires the `amsthm' as a backend for theorems
%   It optionally requires the `hyperref' and `cleveref' packages for references
%   The `hyperref' package is in common class, the `cleveref' package is not
%   Additionally, `cleveref' cannot be loaded before `amsthm' package
%   Therefore these are all loaded here
%   If you don't need `cleveref' or `amsmath' you can remove them from here
\RequirePackage{amsmath,amssymb,amsxtra,amsthm}
\RequirePackage[noabbrev,nameinlink]{cleveref}
\RequirePackage{thmtools}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Abstract setup  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Define nice looking abstract with ssfamily font if `sftitle' is set
\renewenvironment{abstract}{%
  \begin{quotation}
    \if@tufte@sftitle
      \begin{sffamily}
    \fi
}{%
    \if@tufte@sftitle
      \end{sffamily}
    \fi
  \end{quotation}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  Define and style note environments  %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Declare Note environments using the `thmtools' package
% General style for the Note environments
\declaretheoremstyle[%
  % Set reference names for the Note environments
  refname={Note,Notes},%
  Refname={Notes,Notes},%
  % Force body text to be italicized
  bodyfont=\itshape,%
  % Set name/title so it's not using environment name
  title={Note}%
]{Note}

% Declare the ShadedNote environment
\declaretheorem[%
  % Add a shaded background to the Note
  shaded={bgcolor=tufte-pastel-purple,textwidth=30em},%
  % Set the style to the Note style defined above
  style={Note}%
]{ShadedNote}

% Declare the FramedNote environment
\declaretheorem[%
  % Add a framing box to the left of Note
  thmbox={M},%
  % Share the numbering counter with the ShadedNote environment
  sibling={ShadedNote},%
  % Set the style to the Note style defined above
  style={Note}%
]{FramedNote}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%  Style sections headers  %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Only style the sections if the `moderntitles' option is set
\ifthenelse{\boolean{@tufte@handout@moderntitles}}{%
  %
  % The `sectsty' package is required for section styling
  \RequirePackage{sectsty}
  %
  % Set the section numbering depth to 2 so subsections and above are numbered
  \setcounter{secnumdepth}{2}
  %
  % Style paragraphs and (sub)sections with a colored font and numbered boxes
  % Color section numbers white so they contrast with colored boxes better
  % NOTE: This causes issue with `\cref' command from `cleveref' package
  %       as referred section numbers will be white and not visible in pdf
  %       If you use `cleveref' package, use `\nameref' instead of `\cref'
  \renewcommand\thesection{\color{tufte-white}\arabic{section}}
  %
  % Style the paragraphs, make text tufte-purple and bold
  \renewcommand{\paragraph}{\@startsection{paragraph}% Name of the section
    % Level, 0 is chapter, 1 is section, 2 is subsection, 4 is paragraph  
    {4}%
    % Indent from left margin, 0 is no indent, negative values are permitted
    {\z@}%
    % Beforeskip, vertical space before the heading
    {-1ex \@plus -1ex \@minus -.3ex}%
    % Afterskip, vertical space after the heading
    {-1em \@plus .2ex}%
    % Style for the section
    {\normalfont\normalsize\bfseries\color{tufte-purple}}%
  }%
  %
  % Style the subsections, add blue-colored box with matching italic text 
  \renewcommand{\subsection}{\@startsection{subsection}% Name of the section
    % Level, 0 is chapter, 1 is section, 2 is subsection, 4 is paragraph  
    {2}%
    % Indent from left margin, 0 is no indent, negative values are permitted
    {-1.8em}%
    % Beforeskip, vertical space before the heading
    {-3ex \@plus -1ex \@minus -.2ex}%
    % Afterskip, vertical space after the heading
    {1.5ex \@plus .2ex}%
    % Style for the section
    {
      \hspace*{-5.5em}%
      \fcolorbox{tufte-blue}{tufte-blue}{\parbox[c][2ex][b]{3.25em}{\phantom{space}}}%
      \hspace*{-.25em}\normalfont\large\bfseries\itshape\color{tufte-blue}%
      \hspace*{.25em}%
    }%
  }%
  %
  % Style the sections, add purple-colored box with matching italic text
  \renewcommand{\section}{\@startsection{section}% Name of the section
    % Level, 0 is chapter, 1 is section, 2 is subsection, 4 is paragraph  
    {1}%
    % Indent from left margin, 0 is no indent, negative values are permitted
    {-1.01em}%
    % Beforeskip, vertical space before the heading
    {-3ex \@plus -1ex \@minus -.2ex}%
    % Afterskip, vertical space after the heading
    {1.5ex \@plus .2ex}%
    % Style for the section
    {
      \hspace*{-5.5em}%
      \fcolorbox{tufte-purple}{tufte-purple}{\parbox[c][2ex][b]{5em}{\phantom{space}}}%
      \hspace*{-.5em}\normalfont\Large\bfseries\itshape\color{tufte-purple}%
      \hspace*{.25em}%
    }%
  }%
}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%  Load user's customization file if present %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% If there is a `custom-tufte-handout.tex' file, load it
% This file contains user's common customization for all tufte-handout classes
\IfFileExists{custom-tufte-handout.tex}{%
  \input{custom-tufte-handout.tex}%
  \@tufte@info@noline{Loading custom-tufte-handout.tex}%
}{}

\endinput

