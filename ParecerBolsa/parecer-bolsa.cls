\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{parecer}[2004/01/28 Parecer]
\LoadClass[12pt,oneside,a4paper]{article}


\RequirePackage[brazil]{babel}
\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}


\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\period#1{\gdef\@period{#1}}%
\def\@period{\@latex@error{No \noexpand\period given}\@ehc}%

\def\student#1{\gdef\@student{#1}}%
\def\@student{\@latex@error{No \noexpand\student given}\@ehc}%

\def\grant#1{\gdef\@grant{#1}}%
\def\@grant{\@latex@error{No \noexpand\grant given}\@ehc}%


\def\relevant#1{\gdef\@relevant{#1}}%
\def\@relevant{\@latex@error{No \noexpand\relevant given}\@ehc}%

\begin{document}

\pagestyle{empty}

\begin{center}
	\large
	\textbf{
 		PARECER \\
		Sobre as Atividades realizadas pelo bolsista \\
		\student \\
		durante o \period
	}
\end{center}

\vspace{1cm}

Conforme pode ser observado no Relatório de Atividades apresentado pelo bolsista \grant \student, seu envolvimento com o projeto de pesquisa tem sido bastante satisfatório. Entre as
atividades realizadas, destacam-se: \relevant.

O bolsita tem demonstrado seriedade e responsabilidade na realização das atividades, que estão dentro dos prazos previstos. Acredito que a qualidade de seu trabalho será alcançada com êxito.

\vspace{1cm}

\begin{flushright}
São Carlos, 30 de janeiro de 2004.
\end{flushright}

\vspace{1cm}

\begin{flushright}
\advisor
\end{flushright}

\end{document}
