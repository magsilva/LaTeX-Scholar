%% normas-utf-tex.cls
%% Copyright 200?-2011 Diogo Rosa Kuiaski <diogo.kuiaski@gmail.com>
%% Copyright 200?-2011 Hugo Vieira Neto <hvieir@utfpr.edu.br>
%% Copyright 2011      César M. Vargas Benítez <cesarvargasb@gmail.com>
%% Copyright 2011-2013      Marcos Talau <talau@users.sourceforge.net>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
% http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
% 
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is normas-utf-sf.net.
% 
% This work consists of the file normas-utf-tex.cls

% dependência: abntex >= 0.9-beta2

\NeedsTeXFormat{LaTeX2e}

\LoadClassWithOptions{book}
\RequirePackage{latexscholar-book}
\RequirePackage{latexscholar-text-spacing}
\RequirePackage{pdfpages}

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\coadvisor#1{\gdef\@coadvisor{#1}}%
\def\@coadvisor{\@latex@error{No \noexpand\coadvisor given}\@ehc}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address given}\@ehc}%

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university given}\@ehc}%

\def\universityunit#1{\gdef\@universityunit{#1}}%
\def\@universityunit{\@latex@error{No \noexpand\universityunit given}\@ehc}%

\def\program#1{\gdef\@program{#1}}%
\def\@program{\@latex@error{No \noexpand\program given}\@ehc}%

\def\depositshortdate#1{\gdef\@depositshortdate{#1}}%
\def\@depositshortdate{\@latex@error{No \noexpand\depositshortdate given}\@ehc}%

\def\goal#1{\gdef\@goal{#1}}%
\def\@goal{\@latex@error{No \noexpand\goal given}\@ehc}%

\def\degree#1{\gdef\@degree{#1}}%
\def\@degree{\@latex@error{No \noexpand\degree given}\@ehc}%

\def\degreearea#1{\gdef\@degreearea{#1}}%
\def\@degreearea{\@latex@error{No \noexpand\degreearea given}\@ehc}%

\newcommand{\advisorlabel}{Orientador}
\newcommand{\coadvisorlabel}{Coorientador}

%Altera o tamanho da indentacao do paragrafo
\setlength{\parindent}{1.5cm} %

% \newcommand{\ABNTifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAPA

\newcommand{\coverpageone}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\centering
		{
			\singlespacing
			\large\allcaps{\@university}\\
			\large\allcaps{\@universityunit}\\
			\large\allcaps{\@program}\par	
		}
		\vspace{56pt}	
		{
			\singlespacing
			\large\textbf{\allcaps{\@author}}\\
		}
		\vfill
		{
			\singlespacing
			\Large\textbf{\allcaps{\@title}} \par 
		}
		\vspace{48pt}
		\large\allcaps{\@goal}
		\vfill
		\textbf{\allcaps{\@address}}\par
		\textbf{\@depositshortdate}
	\end{adjustwidth}
	\clearpage{\pagestyle{empty}\cleardoublepage}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FOLHA DE ROSTO 

\newcommand{\esporient}[2]
{
	\leftskip 0em
	\@tempdima 6.4em
	\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
	{#1#2\hfil}
}

\newcommand{\coverpagetwo}
{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\begin{center}
				\singlespacing
				\large\textbf{\allcaps{\@author}}\\
		\end{center}
		\vfill
		\begin{center}
			\Large\textbf{\allcaps{\@title}}\par
		\end{center}
		\vspace{60pt}
		\hspace{.45\textwidth}	
		\begin{minipage}{.52\textwidth}
				\singlespacing
				\hyphenpenalty=10000
				\@goal apresentado ao \@program da \@university como requisito parcial
				para obtenção do grau de \@degree em \@degreearea.\par
				\esporient{\numberline{\advisorlabel:}}{\hspace{2mm}\@advisor}\par
				\vspace{-8pt}
				\esporient{\numberline{\coadvisorlabel:}}{\hspace{2mm}\@coadvisor}\par
		\end{minipage}
		\vfill
		\begin{center}
			\textbf{\allcaps{\@address}}\par
			\textbf{\@depositshortdate}
		\end{center}
	\end{adjustwidth}
}

% Title and cover page
%
\renewcommand{\maketitle}{%
	\begin{titlepage}
		\coverpageone
		\coverpagetwo
	\end{titlepage}
}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % TERMO DE APROVACAO
% 
% \providecommand{\ABNTtextoaprovacaodata}{}
% \newcommand{\textoaprovacao}[1]{\renewcommand{\ABNTtextoaprovacaodata}{#1}}
% 
% \providecommand{\ABNTprimeiroassinadata}{}
% \newcommand{\primeiroassina}[1]{\renewcommand{\ABNTprimeiroassinadata}{#1}}
% 
% \providecommand{\ABNTsegundoassinadata}{}
% \newcommand{\segundoassina}[1]{\renewcommand{\ABNTsegundoassinadata}{#1}}
% 
% \providecommand{\ABNTterceiroassinadata}{}
% \newcommand{\terceiroassina}[1]{\renewcommand{\ABNTterceiroassinadata}{#1}}
% 
% \providecommand{\ABNTquartoassinadata}{}
% \newcommand{\quartoassina}[1]{\renewcommand{\ABNTquartoassinadata}{#1}}
% 
% \providecommand{\ABNTlocaldiadata}{}
% \newcommand{\localdia}[1]{\renewcommand{\ABNTlocaldiadata}{#1}}
% 
% \newcommand{\termodeaprovacao}
% {
% 	\begin{titlepage}
% 		\pretextualchapter{TERMO DE APROVA\c{C}\~AO}
% 		\vspace{-0.25cm}
% 		\begin{center}
% 			\large\ABNTautordata
% 		\end{center}
% 		\vspace{0.75cm}
% 		\begin{center}
% 			\large\allcaps{\ABNTtitulodata}
% 		\end{center}
% 		\vspace{0.75cm}
% 		{
% 			\singlespacing
% 			\noindent\ABNTtextoaprovacaodata\par
% 		}
% 		\setlength{\ABNTsignthickness}{0.4pt}
% 		\setlength{\ABNTsignskip}{1.75cm}
% 		\ABNTifnotempty{\ABNTprimeiroassinadata}%
% 		{
% 		\begin{center}
% 			\vspace{-0.5cm}
% 			\assinatura{\ABNTprimeiroassinadata}
% 		\end{center}
% 		}
% 		\ABNTifnotempty{\ABNTsegundoassinadata}%
% 		{
% 		\begin{center}
% 			\vspace{-0.5cm}
% 			\assinatura{\ABNTsegundoassinadata}
% 		\end{center}
% 		}
% 		\ABNTifnotempty{\ABNTterceiroassinadata}%
% 		{
% 		\begin{center}
% 			\vspace{-0.5cm}
% 			\assinatura{\ABNTterceiroassinadata}
% 		\end{center}
% 		}
% 		\ABNTifnotempty{\ABNTquartoassinadata}%
% 		{%
% 		\begin{center}
% 			\vspace{-0.5cm}
% 			\assinatura{\ABNTquartoassinadata}
% 		\end{center}
% 		}
% 		\vfill
% 		\begin{center}
% 			\ABNTlocaldiadata
% 		\end{center}
% 	\end{titlepage}
% }
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %   Ficha catalografica
% \providecommand{\UTFPRfichacatpumdata}{}
% \newcommand{\fichacatpum}[1]{\renewcommand{\UTFPRfichacatpumdata}{#1}}
% \providecommand{\UTFPRfichacatautordata}{}
% \newcommand{\fichacatautor}[1]{\renewcommand{\UTFPRfichacatautordata}{#1}}
% \providecommand{\UTFPRfichacatpgbibdata}{}
% \newcommand{\fichacatpgbib}[1]{\renewcommand{\UTFPRfichacatpgbibdata}{#1}}
% \providecommand{\UTFPRfichacatpalchadata}{}
% \newcommand{\fichacatpalcha}[1]{\renewcommand{\UTFPRfichacatpalchadata}{#1}}
% \providecommand{\UTFPRfichacatpdoisdata}{}
% \newcommand{\fichacatpdois}[1]{\renewcommand{\UTFPRfichacatpdoisdata}{#1}}
% \providecommand{\UTFPRfichacatbibdata}{}
% \newcommand{\fichacatbib}[1]{\renewcommand{\UTFPRfichacatbibdata}{#1}}
% 
% \newcommand{\fichacat}
% {
%   %% \hspace{8em}
%   \newcommand{\lenauthor}{\hspace{8px}}
%   \newcommand{\lencore}{\hspace{8px}}
%   \thispagestyle{empty}
%   {
%     \footnotesize{
%       \vspace*{12.8cm}
%       \begin{center}
%         \begin{tabular}{c}
%           {
%             Dados Internacionais de Cataloga\c{c}\~{a}o na Publica\c{c}\~{a}o
%           }
%         \end{tabular}
%       \end{center}
%     }
%     \vspace{-45px}
%     %% line
%     \begin{center}
%       \line(1,0){385}
%     \end{center}
%     \vspace{-15px}
% 
%     \begin{table}[h!]
%       %% \setlength{\extrarowheight}{5px}
%       \begin{center}
%         \scriptsize{
%           \begin{tabular}{lp{12cm}}
%             %% personal data
%             \UTFPRfichacatpumdata \lenauthor & \UTFPRfichacatautordata \\
%             \lenauthor & \hspace{12px} \ABNTtitulodata / \ABNTautordata. -- \the\year. \\
%             & \lencore \pageref{LastPage} f. : il. ; 30 cm \\
%             & \\
%             & \lencore Orientador: \ABNTorientadordata. \\
%             & \lencore \UTFPRdocumentodata $\;$(\UTFPRniveldata) -- \ABNTinstituicaodata. \UTFPRprogramadata.  \ABNTlocaldata, \the\year. \\
%             & \lencore Bibliografia: f. \UTFPRfichacatpgbibdata. \\
%             & \\
%             & \lencore \UTFPRfichacatpalchadata \\
%             & \\
%             & \\
%             & \hfill \UTFPRfichacatpdoisdata \\
%             %% eof personal data
%           \end{tabular}
%         }
%       \end{center}
%     \end{table}
%     \vspace{-50px}
% 
%     \begin{center}
%       \line(1,0){385}
%     \end{center}
% 
%     \vspace{-40px}
%     \center \footnotesize \UTFPRfichacatbibdata
%     \newpage
%   }
% }
% 
