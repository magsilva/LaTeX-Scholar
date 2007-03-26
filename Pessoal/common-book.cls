\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-book}[2007/03/23 Common book]

\LoadClass[12pt,twoside,a4paper]{book}
\RequirePackage{common}

% Pacote necess�rio para fazer a folha de rosto e a capa (alterar as margens para
% centralizar o texto).
\RequirePackage{chngpage}

% "Pro�be" linhas orfas e viuvas
\widowpenalty = 9999
\clubpenalty = 9999

% Espa�o entre par�grafos
\setlength{\parskip}{3pt}

% Cria��o de tabelas
\RequirePackage{array}
\RequirePackage{tabularx}

% Do no use uppercase for \bibname.
\renewenvironment{thebibliography}[1]{
	\chapter*{\mybibname}%
	\list{
		\@biblabel{\@arabic\c@enumiv}
	}{
		\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}
	}
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m
}{
	\def\@noitemerr
	{\@latex@warning{Empty thebibliography environment}}
	\endlist
}



% Bug 94 (Uso indevido de markboth).
% Causa a inser��o do t�tulo do cap�tulo no cabe�alho da p�gina.
\if@twoside
	\def\ps@headings{
		\let\@oddfoot\@empty
		\let\@evenfoot\@empty
		\def\@evenhead{\thepage\hfil}
		\def\@oddhead{\hfil\thepage}
		\let\@mkboth\markboth
	}
\else
	\def\ps@headings{
		\let\@oddfoot\@empty
		\def\@oddhead{\hfil\thepage}
		\let\@mkboth\markboth
	}
\fi

% Bug 94
\renewcommand\tableofcontents{
	\cleardoublepage
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\contentsname}
	\@starttoc{toc}
	\if@restonecol
		\twocolumn
	\fi
}

% Bug 94
\renewcommand\listoffigures{
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\listfigurename}
	\@starttoc{lof}
	\if@restonecol
		\twocolumn
	\fi
}

% Bug 94
\renewcommand\listoftables{
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\listtablename}
	\@starttoc{lot}
	\if@restonecol
		\twocolumn
	\fi
}

% Bug 94
\renewenvironment{theindex}{
	\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
	\fi
	\columnseprule \z@
	\columnsep 35\p@
	\twocolumn[\@makeschapterhead{\indexname}]
	\thispagestyle{plain}\parindent\z@
	\parskip\z@ \@plus .3\p@\relax
	\let\item\@idxitem
}{
	\if@restonecol
		\onecolumn
	\else
		\clearpage
	\fi
}

% Comando para criar a dedicat�ria
\newcommand{\dedicate}{
	\cleardoublepage
	\vfill
	\hfill
	\parbox{.4\linewidth}{\textsl{\@dedication}}
	\vspace{3cm}
}

% Ambientes para colocar o resumo (portugu�s e ingl�s). Observe que as margens
% desses ambientes s�o ligeiramente reduzidas, dando uma apar�ncia, hum, melhor.
\newenvironment{abstract}{
	\chapter*{Abstract}
	\addcontentsline{toc}{chapter}{Abstract}
	\narrower
	\vfill
}{
	\vfill
}
\newenvironment{resumo}{
	\chapter*{Resumo}
	\addcontentsline{toc}{chapter}{Resumo}
	\narrower
	\vfill
}{
	\vfill
}

\newenvironment{agradecimentos}{
	\cleardoublepage
	\chapter*{Agradecimentos}
	\thispagestyle{empty}
}{
	\thispagestyle{empty}
}

% Gloss�rio
\RequirePackage{makeglo}
\makeglossary

% Cria��o de �ndice remissivo.
\RequirePackage{makeidx}
\makeindex

% referencias com p�gina \vref
\RequirePackage[brazil]{varioref}

% indenta primeiro par�grafo
\RequirePackage{indentfirst}

% Pretty chapter start at frontmatter
\newpagestyle{frontmatter}{
	\sethead{}
		{}
		{}
	\setfoot{}
		{\thepage}
		{}
}

% Pretty chapter start at mainmatter
\newpagestyle{mainmatter}[\small\sffamily]{
	\headrule
	\sethead{}
		{}
		{}
	\setfoot{}
		{\thepage}
		{}
}

% Pretty chapter start at backmatter
\newpagestyle{backmatter}{
	\headrule
	\sethead{}
		{}
		{}
	\setfoot{}
		{\thepage}
		{}
}


% Configura cabe�alho e rodap� das p�ginas do corpo do texto para
% conter, p�ginas pares, o nome da se��o e, nas p�ginas impares, o nome
% do cap�tulo.
\renewcommand\frontmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagestyle{frontmatter}
	\pagenumbering{roman}
	\titlespacing{\chapter}{0pt}{2.5em}{10em}[0pt]
}

\renewcommand\mainmatter{
	\cleardoublepage
	\@mainmattertrue
	\pagestyle{mainmatter}
	\pagenumbering{arabic}
	\titlespacing{\chapter}{0pt}{2.5em}{20em}[0pt]
	\acresetall{}
}

\renewcommand\backmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagestyle{backmatter}
	\pagenumbering{arabic}
	\titlespacing{\chapter}{0pt}{2.5em}{10em}[0pt]
}

% Macro para destacar as primeiras letras do texto. Um texto do tipo:
%
%  \begin{document}
%    \versal{IN} THE beginning God created the heaven and the earth.  Now the
%    earth was unformed and void, and darkness was upon the face of the
%    deep; and the spirit of God hovered over the face of the waters.
%  \end{document}
%
%  produzir� algo como:
%
%  I I\  I THE beginning God  created the heaven and  the earth.
%  I I \ I Now the earth was unformed and void, and darkness was
%  I I  \I upon the face of the deep; and the spirit of God hov-
%  ered over the face of the waters.
\font\versalfont= pzcmi scaled 6500
\newcommand{\versal}[1]{{\noindent
    \setbox0\hbox{\versalfont #1 }%
    \count0=\ht0                   % height of versal
    \count1=\baselineskip          % baselineskip
    \divide\count0 by \count1      % versal height/baselineskip
    \dimen1 = \count0\baselineskip % distance to drop versal
    \advance\count0 by 1\relax     % no of indented lines
    \dimen0=\wd0                   % width of versal
    \global\hangindent\dimen0      % set indentation distance
    \global\hangafter-\count0      % set no of indented lines
    \hskip-\dimen0\setbox0\hbox to\dimen0{\raise-\dimen1\box0\hss}%
    \dp0=0in\ht0=0in\box0}}


% Pretty chapter start
\font\chapternumberfont= goxi2074 scaled 2000
\titleformat{\chapter}[display]
	{\normalfont\Large\sffamily}
	{
		\filright
		\rule[32pt]{.7\linewidth}{4pt}
		\hspace{-8pt}
		\shadowbox{
			\begin{minipage}{.18\linewidth}
				\centering
				\textsc{\Large\chaptertitlename}\\
				\vspace{1ex}
				{\chapternumberfont \thechapter}\\
				\vspace{1ex}
			\end{minipage}
		}
	}
	{0pt}
	{\filcenter\Huge}
	[\hfill\rule{.8\textwidth}{0.5pt}\\\vskip-1.8ex\hfill\rule{.7\textwidth}{3pt}]

% Cria o cabe�alho da p�gina inicial do cap�tulo.
%\titleformat{\chapter}[display]
%	{
%		\sffamily\Huge
%	}
%	{
%		\begin{tabular}{|c|}
%			\rowcolor{black}
%			\color{white}
%			\large
%			\scshape
%			\chaptername \\
%			\vspace{-2ex} \\
%			\Huge
%			\slshape
%			\scaletoheight{1cm}{\thechapter} \\ \hline
%		\end{tabular}
%	}
%	{8pt}
%	{\Huge\bfseries\filleft}
%	[\hfill\rule{.8\textwidth}{0.5pt}\\
%	\vskip-2.4ex\hfill\rule{.8\textwidth}{2pt}\\
%	\vskip 1.5ex]