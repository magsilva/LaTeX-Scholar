% Document class for Unified Process Methodology
%
% Copyright (c) 2006-2007 Stephane GALLAND <galland@arakhne.org>
% 
% This program is free library; you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as
% published by the Free Software Foundation; either version 3 of the
% License, or any later version.
%
% This library is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% Lesser General Public License for more details.
%
% You should have received a copy of the GNU Lesser General Public
% License along with this library; see the file COPYING.  If not,
% write to the Free Software Foundation, Inc., 59 Temple Place - Suite
% 330, Boston, MA 02111-1307, USA.
%
% Creation date: 2006-04-06
% Modifications:
%   2007-07-03   Force the height of the small logo in headers.
%                Remove the copyright date building function.
%   2007-03-19   Add localization.
%   2006-04-19   Add version number.
%   2006-04-20   Add task package.
%   2006-04-21   Add specification package.
%   2006-04-22   Remove task and specification packages.
%

\global\edef\upm@package@docclazz@ver{2007/07/03}

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{upmethodology-document}[\upm@package@docclazz@ver]

\DeclareOption{twoside}{%
  \PassOptionsToClass{twoside,openright}{book}
}
\DeclareOption{oneside}{%
  \PassOptionsToClass{oneside}{book}
}

\DeclareOption{french}{%
  \PassOptionsToClass{french}{book}
  \PassOptionsToPackage{french}{upmethodology-document}
}
\DeclareOption{francais}{%
  \PassOptionsToClass{french}{book}
  \PassOptionsToPackage{french}{upmethodology-document}
}
\DeclareOption{english}{%
  \PassOptionsToClass{english}{book}
  \PassOptionsToPackage{english}{upmethodology-document}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{oneside}
\ProcessOptions

\PassOptionsToClass{a4paper,11pt}{book}
\LoadClass{book}

\RequirePackage{a4wide}
\RequirePackage{fancyhdr}

\RequirePackage{upmethodology-document}
\RequirePackage{upmethodology-frontpage}

\pdfpageheight=29.7cm
\pdfpagewidth=21.0cm

%----------------------------------------
% HEADERS AND FOOTERS
%----------------------------------------

\def\upm@header@fmt#1{\textsc{\scriptsize #1}}
\def\upm@copyright@fmt#1{\textsc{\tiny #1}}

\pagestyle{fancyplain}

\newdimen{\upm@smalllogo@height}
\upm@smalllogo@height=1cm

\if@twoside



\lhead[\includegraphics[height=\upm@smalllogo@height]{\theupmsmalldoclogo}]{\fancyplain{}{\upm@header@fmt{\theupmfulldocname}}}
\chead{}
\rhead[\fancyplain{}{\upm@header@fmt{\theupmfulldocname}}]{\includegraphics[height=\upm@smalllogo@height]{\theupmsmalldoclogo}}
\lfoot[\upm@header@fmt{\thepage}]{\upm@copyright@fmt{\theupmdocref~\copyright~\upmcopyrightdate~\theupmpublisher}}
\cfoot{}
\rfoot[\upm@copyright@fmt{\tiny\theupmdocref~\copyright~\upmcopyrightdate~\theupmpublisher}]{\upm@header@fmt{\thepage}}

\else

\lhead{\fancyplain{}{\upm@header@fmt{\theupmfulldocname}}}
\chead{}
\rhead{\includegraphics[height=\upm@smalllogo@height]{\theupmsmalldoclogo}}
\lfoot{\upm@copyright@fmt{\tiny\theupmdocref~\copyright~\upmcopyrightdate~\theupmpublisher}}
\cfoot{}
\rfoot{\upm@header@fmt{\thepage}}

\fi

%----------------------------------------
% AUTO-GENERATED DOCUMENT
%----------------------------------------

\AtBeginDocument{
	\maketitle
	\thispagestyle{plain}\upmdocumentsummary\upmdocumentauthors\upmdocumentvalidators\upmdocumentinformedpeople\vfill\upmhistory\cleardoublepage
	\sloppy
}

\endinput
