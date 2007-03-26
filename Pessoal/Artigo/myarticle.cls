\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myarticle}[2006/06/21 Customized article]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{common-article}}
\ProcessOptions

\LoadClass{common-article}