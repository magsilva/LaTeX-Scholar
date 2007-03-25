\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-book}[2007/03/23 Common book]

\LoadClass[12pt,twoside,a4paper]{book}
\RequirePackage{common}

% Pacote necessário para fazer a folha de rosto e a capa (alterar as margens para
% centralizar o texto).
\RequirePackage{chngpage}

% "Proíbe" linhas orfas e viuvas
\widowpenalty = 10000
\clubpenalty = 10000

% Espaço entre parágrafos
\setlength{\parskip}{3pt}

% Criação de tabelas
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
% Causa a inserção do título do capítulo no cabeçalho da página.
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

% Comando para criar a dedicatória
\newcommand{\dedicate}{
	\cleardoublepage
	\vfill
	\hfill
	\parbox{.4\linewidth}{\textsl{\@dedication}}
	\vspace{3cm}
}

% Ambientes para colocar o resumo (português e inglês). Observe que as margens
% desses ambientes são ligeiramente reduzidas, dando uma aparência, hum, melhor.
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

% Glossário
\RequirePackage{makeglo}
\makeglossary

% Criação de índice remissivo.
\RequirePackage{makeidx}
\makeindex

% referencias com página \vref
\RequirePackage[brazil]{varioref}

% indenta primeiro parágrafo
\RequirePackage{indentfirst}

