\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techreport}[2006/07/05 ICMC Technical Report]
\LoadClass[12pt,twoside,a4paper]{book}

\RequirePackage[english,brazil]{babel}
\RequirePackage[latin1]{inputenc}

\RequirePackage{url}

% Definição do posicionamento padrão das tabelas e figuras
\RequirePackage{float}
\restylefloat{table}
\restylefloat{figure}
\floatplacement{table}{!htb}
\floatplacement{figure}{!htb}

% Otimização no espaço ocupado por floats
\renewcommand{\floatsep}{8pt}
\renewcommand{\intextsep}{12pt}
\renewcommand{\textfloatsep}{12pt}

% Diminui o espaço entre um float e seu caption.
\setlength{\abovecaptionskip}{4pt}

% Pacote para coordenar o posionamento de floats.
% Utilize \afterpage{\clearpage} para forçar que todos os floats definidos até
% aquele momento sejam inseridos.
\RequirePackage{afterpage}

% Habilitar a utilização de figuras
\RequirePackage[pdftex]{graphicx}
\RequirePackage{epstopdf}

% Alteração das margens das páginas
\RequirePackage[pdftex]{geometry}
\geometry{a4paper,left=2.5cm,right=2cm,top=2cm,bottom=3.5cm}

% Configuração do espaçamento entre linhas (1,5)
\RequirePackage{setspace}
\onehalfspace

% Configuração da indentação do parágrafo
\setlength{\parindent}{1.3cm}

% Lista de acrônimos
\RequirePackage[printonlyused]{acronym}

% Macro utilizada para termos em inglês.
\newcommand\foreign[1]{\foreignlanguage{english}{\textit{#1}}}

% Macro utilizada para trechos de código-fonte inseridos no meio do texto.
\newcommand\srccode[1]{\foreignlanguage{english}{\texttt{\small{#1}}}}

% Utilizado para listagens de código-fonte
\RequirePackage{listings}
\lstset{basicstyle=\tiny}
\lstset{tabsize=4}
\lstset{frame=single}
\lstset{aboveskip=.5cm}
\lstset{belowskip=.5cm}
\lstset{xleftmargin=1cm}
\lstset{xrightmargin=1cm}
\lstset{resetmargins=true}
\lstset{frame=single}


% Traduz os nomes de listagens e fragmentos de código para português
\renewcommand{\lstlistingname}{Fragmento de código}
\renewcommand{\lstlistlistingname}{Lista de fragmentos de código}

% Adequação das citações e referências a norma ABNT
\RequirePackage[alf,abnt-url-package=url]{abntcite}

\RequirePackage[nottoc,notindex,notlot,notlof,numbib]{tocbibind}

% Folha de rosto e capa
\renewcommand{\maketitle}{%
	\begin{titlepage}
		\thispagestyle{empty}
		\newpage
		\null
		\vfill
		\begin{minipage}{.7\linewidth}
			\begin{center}
				{\Large \textsf{\@title} \par}
				\vskip 3em
				{\large \textbf{\textit{\@author}} \normalsize \par}
			\end{center}
		\end{minipage}
		\vfill
	\end{titlepage}
	\clearpage
	\thispagestyle{empty}
	\cleardoublepage
}	
